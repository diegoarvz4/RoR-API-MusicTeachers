# frozen_string_literal: true

class MusicGenresController < ApplicationController
  before_action :set_music_genre, only: %i[show update destroy]

  def index
    @music_genres = MusicGenre.all
    json_response(@music_genres)
  end

  def create
    @music_genre = MusicGenre.create!(music_genre_params)
    json_response(@music_genre, :created)
  end

  def show
    json_response(@music_genre)
  end

  def update
    @music_genre.update(music_genre_params)
    head :no_content
  end

  def destroy
    @music_genre.destroy
    head :no_content
  end

  private

  def music_genre_params
    params.permit(:category)
  end

  def set_music_genre
    @music_genre = MusicGenre.find(params[:id])
  end
end
