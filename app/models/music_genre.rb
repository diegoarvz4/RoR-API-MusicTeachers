class MusicGenre < ApplicationRecord
  has_and_belongs_to_many :music_teachers
  validates_presence_of :category
end
