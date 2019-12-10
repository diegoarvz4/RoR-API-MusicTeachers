class MusicTeacher < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_and_belongs_to_many :music_genres
  has_and_belongs_to_many :musical_instruments
  validates_presence_of :name
end
