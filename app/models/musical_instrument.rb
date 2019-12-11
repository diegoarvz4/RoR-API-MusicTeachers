# frozen_string_literal: true

class MusicalInstrument < ApplicationRecord
  has_and_belongs_to_many :music_teachers
  validates_presence_of :kind
end
