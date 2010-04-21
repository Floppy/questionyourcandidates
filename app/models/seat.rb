class Seat < ActiveRecord::Base
  validates_uniqueness_of :name, :code

  has_many :candidates, :order => :name
  has_many :events, :order => :starting_at

  def to_param
    code
  end

  def init_bounding_box!
    if min_lat.nil?
      res = Net::HTTP.post_form(URI.parse('http://www.theyworkforyou.com/api/getGeometry'),
                                {'name'=>name, 'future'=>'1', 'key' => APP_CONFIG[:twfy_key]})
      json = JSON.parse(res.body)
      if (json['min_lat'])
        self.min_lat = json['min_lat']
        self.min_lon = json['min_lon']
        self.max_lat = json['max_lat']
        self.max_lon = json['max_lon']
        save(false)
      end
    end
  end

end
