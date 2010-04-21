class Attendance < ActiveRecord::Base
  belongs_to :event
  belongs_to :candidate
  validates_presence_of :event, :candidate
end
