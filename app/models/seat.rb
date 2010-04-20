class Seat < ActiveRecord::Base
  validates_uniqueness_of :name, :code

  has_many :candidates
  has_many :events

  def to_param
    code
  end

end
