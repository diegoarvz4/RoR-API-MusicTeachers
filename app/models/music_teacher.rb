class MusicTeacher < ApplicationRecord
  has_many :appointments, dependent: :destroy
  validates_presence_of :name
end
