# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MusicTeacher, type: :model do
  it { should have_many(:appointments).dependent(:destroy) }
  it { should have_and_belong_to_many(:music_genres) }
  it { should validate_presence_of(:name) }
end
