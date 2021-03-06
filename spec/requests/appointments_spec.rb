# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Appointments API' do
  let!(:music_teacher) { create(:music_teacher) }
  let!(:user) { create(:user) }
  let!(:appointments) do
    create_list(:appointment,
                20,
                date: Time.now,
                music_teacher_id: music_teacher.id,
                user_id: user.id)
  end
  let(:music_teacher_id) { music_teacher.id }
  let(:id) { appointments.first.id }
  let(:headers) { valid_headers }

  describe 'GET /appointments' do
    before { get '/appointments', params: {}, headers: headers }

    context 'when appointments exist' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all appoointments' do
        expect(json.size).to eq(20)
      end
    end
  end

  describe 'POST /appointments' do
    let(:date) { Time.now }
    let(:music_teacher_) { create(:music_teacher) }
    let(:user_) { create(:user) }
    let(:valid_attributes) { { music_teacher_id: music_teacher_.id, user_id: user_.id, date: Time.now } }

    context 'when the request is valid' do
      before { post '/appointments', params: valid_attributes.to_json, headers: headers }

      it 'creates an appointment' do
        expect(json['music_teacher_id']).to eq(music_teacher_.id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { date: nil, user_id: nil }.to_json }
      before { post '/appointments', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Music teacher must exist, Date can't be blank/)
      end
    end
  end

  describe 'DELETE /appointments/:id' do
    before { delete "/appointments/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
