# frozen_string_literal: true

class MusicalInstrumentsController < ApplicationController
  def index
    @musical_instruments = MusicalInstrument.all
    render json: @musical_instruments,
           except: %i[created_at updated_at],
           status: :ok
  end
end
