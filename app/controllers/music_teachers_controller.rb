# frozen_string_literal: true

class MusicTeachersController < ApplicationController
  def index
    @music_teachers = MusicTeacher.all
    render json: @music_teachers,
           include: {
             appointments: {
               except: %i[created_at updated_at]
             },
             music_genres: {
               except: %i[created_at updated_at]
             },
             musical_instruments: {
               except: %i[created_at updated_at]
             }
           },
           except: %i[created_at updated_at],
           status: :ok
  end
end
