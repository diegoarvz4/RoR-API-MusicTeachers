# frozen_string_literal: true

class MusicalInstrumentsController < ApplicationController
  before_action :set_musical_instrument, only: %i[show update destroy]

  def index
    @musical_instruments = MusicalInstrument.all
    json_response(@musical_instruments)
  end

  def create
    @musical_instrument = MusicalInstrument.create!(musical_instrument_params)
    json_response(@musical_instrument, :created)
  end

  def show
    json_response(@musical_instrument)
  end

  def update
    @musical_instrument.update(musical_instrument_params)
    head :no_content
  end

  def destroy
    @musical_instrument.destroy
    head :no_content
  end

  private

  def musical_instrument_params
    params.permit(:kind)
  end

  def set_musical_instrument
    @musical_instrument = MusicalInstrument.find(params[:id])
  end
end
