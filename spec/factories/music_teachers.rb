# frozen_string_literal: true

FactoryBot.define do
  factory :music_teacher do
    name { Faker::Lorem.word }
  end
end
