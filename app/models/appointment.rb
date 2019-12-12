# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :music_teacher
  belongs_to :user
  validates_presence_of :date
end
