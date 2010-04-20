class Seat < ActiveRecord::Base
  validates_uniqueness_of :name, :code

  has_many :candidates

  def to_param
    code
  end

end
