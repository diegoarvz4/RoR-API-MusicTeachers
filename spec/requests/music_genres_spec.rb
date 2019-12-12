# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Music Genres API', type: :request do
  # initialize test data
  let!(:music_genres) { create_list(:music_genre, 10) }
  let(:music_genre_id) { music_genres.first.id }
  let!(:user) { create(:user) }
  let(:headers) { valid_headers }
  # Test suite for GET /music_genres
  describe 'GET /music_genres' do
    # make HTTP get request before each example
    before { get '/music_genres', params: {}, headers: headers }

    it 'returns music_genres' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /music_genres/:id
  describe 'GET /music_genres/:id' do
    before { get "/music_genres/#{music_genre_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the music_genre' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(music_genre_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:music_genre_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find MusicGenre/)
      end
    end
  end

  # Test suite for POST /music_genres
  describe 'POST /music_genres' do
    # valid payload
    let(:valid_attributes) { { category: 'Pop' }.to_json }

    context 'when the request is valid' do
      before { post '/music_genres', params: valid_attributes, headers: headers }

      it 'creates a music_genre' do
        expect(json['category']).to eq('Pop')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/music_genres', params: { category: '' }.to_json, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Category can't be blank/)
      end
    end
  end

  # Test suite for PUT /music_genres/:id
  describe 'PUT /music_genres/:id' do
    let(:valid_attributes) { { category: 'Jazz' }.to_json }

    context 'when the record exists' do
      before { put "/music_genres/#{music_genre_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /music_genres/:id
  describe 'DELETE /music_genres/:id' do
    before { delete "/music_genres/#{music_genre_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end