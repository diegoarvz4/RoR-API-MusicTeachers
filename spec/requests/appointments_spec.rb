# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Appointments API' do
  let!(:music_teacher) { create(:music_teacher) }
  let!(:appointments) { create_list(:appointment, 20, date: Time.now, music_teacher_id: music_teacher.id) }
  let(:music_teacher_id) { music_teacher.id }
  let(:id) { appointments.first.id }

  describe 'GET /appointments' do
    before { get '/appointments' }

    context 'when appointments exist' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all appoointments' do
        expect(json.size).to eq(20)
      end
    end
  end

  describe 'GET /appointments/:id' do
    before { get "/appointments/#{id}" }

    context 'when the record exists' do
      it 'returns the appointment' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:id) { 1000 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Appointment/)
      end
    end
  end

  # Test suite for POST /appointments
  describe 'POST /appointments' do
    # valid payload
    let(:date) { Time.now }
    let(:valid_attributes) { { music_teacher_id: music_teacher.id, date: Time.now } }

    context 'when the request is valid' do
      before { post '/appointments', params: valid_attributes }

      it 'creates an appointment' do
        expect(json['music_teacher_id']).to eq(music_teacher_id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/appointments', params: { date: nil } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Music teacher must exist, Date can't be blank/)
      end
    end
  end

  # Test suite for PUT /appointments/:id
  describe 'PUT /appointments/:id' do
    let(:valid_attributes) { { date: Time.now } }

    context 'when the record exists' do
      before { put "/appointments/#{id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /appointments/:id
  describe 'DELETE /appointments/:id' do
    before { delete "/appointments/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
