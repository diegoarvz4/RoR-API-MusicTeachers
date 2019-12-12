class MusicalInstrumentsController < ApplicationController
  before_action :set_musical_instrument, only: [:show, :update, :destroy]

  # GET /musical_instruments
  def index
    @musical_instruments = MusicalInstrument.all
    json_response(@musical_instruments)
  end

  # POST /musical_instruments
  def create
    @musical_instrument = MusicalInstrument.create!(musical_instrument_params)
    json_response(@musical_instrument, :created)
  end

  # GET /musical_instruments/:id
  def show
    json_response(@musical_instrument)
  end

  # PUT /musical_instruments/:id
  def update
    @musical_instrument.update(musical_instrument_params)
    head :no_content
  end

  # DELETE /musical_instruments/:id
  def destroy
    @musical_instrument.destroy
    head :no_content
  end

  private

  def musical_instrument_params
    # whitelist params
    params.permit(:kind)
  end

  def set_musical_instrument
    @musical_instrument = MusicalInstrument.find(params[:id])
  end
end
