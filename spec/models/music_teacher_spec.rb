require 'rails_helper'

RSpec.describe MusicTeacher, type: :model do
  it { should have_many(:appointments).dependent(:destroy) }
  it { should validate_presence_of(:name) }
end
