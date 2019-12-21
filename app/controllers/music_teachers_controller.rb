# frozen_string_literal: true

class MusicTeachersController < ApplicationController
  def index
    @music_teachers = MusicTeacher.all
    render json: @music_teachers,
           include: %i[appointments music_genres musical_instruments],
           except: %i[created_at updated_at],
           status: :ok
  end
end
