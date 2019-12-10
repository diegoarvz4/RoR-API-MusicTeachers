require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { should validate_presence_of(:date) }
  it { should belong_to(:music_teacher) }
end
