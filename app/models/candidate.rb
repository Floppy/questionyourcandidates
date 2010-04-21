class Candidate < ActiveRecord::Base
  validates_uniqueness_of :code
  validates_presence_of :name, :party, :party_code, :code, :image
 
  belongs_to :seat
  has_many :attendances 
  has_many :events, :through => :attendances

  def to_param
    code
  end

end
