require 'rails_helper'

RSpec.describe MusicGenre, type: :model do
  it { should have_and_belong_to_many(:music_teachers) }
  it { should validate_presence_of(:type) }
end
