class Seat < ActiveRecord::Base
  validates_uniqueness_of :name, :code

  def to_param
    code
  end

end
