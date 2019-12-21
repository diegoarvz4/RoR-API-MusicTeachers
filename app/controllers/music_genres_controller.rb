# frozen_string_literal: true

class MusicGenresController < ApplicationController
  def index
    @music_genres = MusicGenre.all
    json_response(@music_genres)
  end
end
