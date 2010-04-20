class Event < ActiveRecord::Base
  belongs_to :seat
 
  validates_datetime :starting_at
  validates_presence_of :location, :description, :reference, :title

  attr_accessible :starting_at, :location, :description, :reference, :title

end
