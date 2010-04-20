require 'json'

namespace :data do

  desc "Initialise seat data from yournextmp"
  task :init => [:environment] do
  
    total_seats = 1
    page = 1
    while Seat.count < total_seats
      json = JSON.parse(Net::HTTP.get(URI.parse("http://www.yournextmp.com/seats/all/#{page}?output=json")))
      total_seats = json['pager']['total_entries']
      json['result'].each do |seat_json|
        seat = Seat.create!(:name => seat_json['name'], :code => seat_json['code'])
        puts seat.name
        seat_json['candidates'].each do |candidate|
          if candidate['image']
            image = candidate['image']['small']['url']
          elsif candidate['party']['image']
            image = candidate['party']['image']['small']['url']
          else
            image = nil
          end
          c = seat.candidates.create(:name => candidate['name'],
                                     :code => candidate['code'],
                                     :party => candidate['party']['name'],
                                     :party_code => candidate['party']['code'],
                                     :image => image)
          puts " - " + c.name
        end
      end
      page = page + 1
    end

  end

end
