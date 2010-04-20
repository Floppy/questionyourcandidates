class MainController < ApplicationController
  def index  
  end

  def search
    res = Net::HTTP.post_form(URI.parse('http://www.theyworkforyou.com/api/getConstituency'),
                              {'postcode'=>params['search']['postcode'], 'future'=>'1', 'key' => APP_CONFIG[:twfy_key]})
    json = JSON.parse(res.body)
    if (json['name'])
      code = json['name'].downcase.gsub(/[^[:alpha:]]/, ' ').squeeze.gsub(" ","_")
      redirect_to :controller => "seats", :action => "show", :id => code
    else
      render :action => "index"
    end
  end

end
