class Candidate < ActiveRecord::Base
  validates_uniqueness_of :code
  validates_presence_of :name, :party, :party_code, :code, :image
 
  belongs_to :seat

  def to_param
    code
  end

end
