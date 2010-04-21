class Event < ActiveRecord::Base
  belongs_to :seat
  has_many :attendances 
  has_many :candidates, :through => :attendances

  validates_datetime :starting_at
  validates_presence_of :location, :title

  attr_accessible :starting_at, :location, :description, :reference, :title, :captcha_solution, :captcha_secret

  has_captcha

end
