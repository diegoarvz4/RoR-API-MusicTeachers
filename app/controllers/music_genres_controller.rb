# frozen_string_literal: true

class MusicGenresController < ApplicationController
  def index
    @music_genres = MusicGenre.all
    render json: @music_genres,
           except: %i[created_at updated_at],
           status: :ok
  end
end
