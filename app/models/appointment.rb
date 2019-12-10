class Appointment < ApplicationRecord
  belongs_to :music_teacher
  validates_presence_of :date
end
