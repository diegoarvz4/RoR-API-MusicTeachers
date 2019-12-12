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

  describe 'GET /musical_instruments/:id' do
    before { get "/musical_instruments/#{musical_instrument_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the musical_instrument' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(musical_instrument_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:musical_instrument_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find MusicalInstrument/)
      end
    end
  end

  describe 'POST /musical_instruments' do
    let(:valid_attributes) { { kind: 'Piano' }.to_json }

    context 'when the request is valid' do
      before { post '/musical_instruments', params: valid_attributes, headers: headers }

      it 'creates a musical_instrument' do
        expect(json['kind']).to eq('Piano')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/musical_instruments', params: { kind: '' }.to_json, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Kind can't be blank/)
      end
    end
  end

  describe 'PUT /musical_instruments/:id' do
    let(:valid_attributes) { { kind: 'Guitar' }.to_json }

    context 'when the record exists' do
      before { put "/musical_instruments/#{musical_instrument_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /musical_instruments/:id' do
    before { delete "/musical_instruments/#{musical_instrument_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
