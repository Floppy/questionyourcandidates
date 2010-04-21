set :application, "questionyourcandidates"
set :repository,  "git@github.com:Floppy/questionyourcandidates.git"

set :scm, :git
set :branch, 'develop'

role :web, "questionyourcandidates.org.uk"
role :app, "questionyourcandidates.org.uk"
role :db,  "questionyourcandidates.org.uk", :primary => true

set :deploy_to, '/home/question'
set :user, 'question'
set :use_sudo, false
ssh_options[:forward_agent] = true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy:update_code", "link:dbconfig", "link:settings"
after "deploy", "deploy:cleanup"

namespace :link do
  desc "Link database yaml"
  task :dbconfig do
    run "ln -s #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  desc "Link settings yaml"
  task :settings do
    run "ln -s #{shared_path}/config/settings.yml #{release_path}/config/settings.yml"
  end
end


