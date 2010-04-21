class MainController < ApplicationController
  def index  
    @has_feed = true
    respond_to do |format|
      format.html
      format.atom {
        @events = Event.find :all, :order => :updated_at, :limit => 20
      }
    end
  end

  def search
    res = Net::HTTP.post_form(URI.parse('http://www.theyworkforyou.com/api/getConstituency'),
                              {'postcode'=>params['search']['postcode'], 'future'=>'1', 'key' => APP_CONFIG[:twfy_key]})
    json = JSON.parse(res.body)
    if (json['name'])
      flash[:notice] = nil
      code = json['name'].downcase.gsub(/[^[:alpha:]]/, ' ').squeeze.gsub(" ","_")
      redirect_to :controller => "seats", :action => "show", :id => code
    else
      flash[:notice] = "Sorry, we couldn't find a constituency for that postcode!"
      render :action => "index"
    end
  end

end
