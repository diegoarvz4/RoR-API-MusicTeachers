# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Music Teachers API', type: :request do
  let!(:music_teachers) { create_list(:music_teacher, 10) }
  let(:music_teacher_id) { music_teachers.first.id }
  let!(:user) { create(:user) }
  let(:headers) { valid_headers }
  describe 'GET /music_teachers' do
    before { get '/music_teachers', params: {}, headers: headers }

    it 'returns music_teachers' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /music_teachers/:id' do
    before { get "/music_teachers/#{music_teacher_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the music_teacher' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(music_teacher_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:music_teacher_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find MusicTeacher/)
      end
    end
  end

  describe 'POST /music_teachers' do
    let(:valid_attributes) { { name: 'Jimmy Page' }.to_json }

    context 'when the request is valid' do
      before { post '/music_teachers', params: valid_attributes, headers: headers }

      it 'creates a music_teacher' do
        expect(json['name']).to eq('Jimmy Page')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/music_teachers', params: { name: '' }.to_json, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /music_teachers/:id' do
    let(:valid_attributes) { { name: 'Robert Plant' }.to_json }

    context 'when the record exists' do
      before { put "/music_teachers/#{music_teacher_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /music_teachers/:id' do
    before { delete "/music_teachers/#{music_teacher_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
