# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Musical Instruments API', kind: :request do
  let!(:musical_instruments) { create_list(:musical_instrument, 10) }
  let(:musical_instrument_id) { musical_instruments.first.id }
  let!(:user) { create(:user) }
  let(:headers) { valid_headers }
  describe 'GET /musical_instruments' do
    before { get '/musical_instruments', params: {}, headers: headers }

    it 'returns musical_instruments' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
