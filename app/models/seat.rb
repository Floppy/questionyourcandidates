class Seat < ActiveRecord::Base
  validates_uniqueness_of :name, :code

  has_many :candidates, :order => :name
  has_many :events, :order => :starting_at

  def to_param
    code
  end

end
