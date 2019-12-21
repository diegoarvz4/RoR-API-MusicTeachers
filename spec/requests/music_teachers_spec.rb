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
end
