# frozen_string_literal: true

class MusicTeachersController < ApplicationController
  before_action :set_music_teacher, only: %i[show update destroy add_music_genre add_musical_instrument]

  def index
    @music_teachers = MusicTeacher.all
    render json: @music_teachers, include: %i[appointments music_genres musical_instruments], status: :ok
  end

  def create
    @music_teacher = MusicTeacher.create!(music_teacher_params)
    json_response(@music_teacher, :created)
  end

  def show
    render json: @music_teacher, include: %i[appointments music_genres musical_instruments], status: :ok
  end

  def update
    @music_teacher.update(music_teacher_params)
    head :no_content
  end

  def destroy
    @music_teacher.destroy
    head :no_content
  end

  def add_music_genre
    @music_genre = MusicGenre.find(params[:music_genre_id])
    @music_teacher.music_genres << @music_genre
    json_response(@music_genre, :created)
  end

  def add_musical_instrument
    @musical_instrument = MusicalInstrument.find(params[:musical_instrument_id])
    @music_teacher.musical_instruments << @musical_instrument
    json_response(@musical_instrument, :created)
  end

  private

  def music_teacher_params
    params.permit(:name, :years_exp, :ranking)
  end

  def set_music_teacher
    @music_teacher = MusicTeacher.find(params[:id])
  end

  def music_teacher_genres_params
    params.permit(:music_genre_id)
  end
end
