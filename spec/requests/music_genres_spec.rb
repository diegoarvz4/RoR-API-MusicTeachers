# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Music Genres API', type: :request do
  let!(:music_genres) { create_list(:music_genre, 10) }
  let(:music_genre_id) { music_genres.first.id }
  let!(:user) { create(:user) }
  let(:headers) { valid_headers }
  describe 'GET /music_genres' do
    before { get '/music_genres', params: {}, headers: headers }

    it 'returns music_genres' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
