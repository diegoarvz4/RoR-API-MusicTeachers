# frozen_string_literal: true

class MusicGenresController < ApplicationController
  before_action :set_music_genre, only: [:show, :update, :destroy]

  # GET /music_genres
  def index
    @music_genres = MusicGenre.all
    json_response(@music_genres)
  end

  # POST /music_genres
  def create
    @music_genre = MusicGenre.create!(music_genre_params)
    json_response(@music_genre, :created)
  end

  # GET /music_genres/:id
  def show
    json_response(@music_genre)
  end

  # PUT /music_genres/:id
  def update
    @music_genre.update(music_genre_params)
    head :no_content
  end

  # DELETE /music_genres/:id
  def destroy
    @music_genre.destroy
    head :no_content
  end

  private

  def music_genre_params
    # whitelist params
    params.permit(:category)
  end

  def set_music_genre
    @music_genre = MusicGenre.find(params[:id])
  end
end
