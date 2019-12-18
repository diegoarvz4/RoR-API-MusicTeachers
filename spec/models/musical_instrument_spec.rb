# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MusicalInstrument, type: :model do
  it { should have_and_belong_to_many(:music_teachers) }
  it { should validate_presence_of(:kind) }
end
