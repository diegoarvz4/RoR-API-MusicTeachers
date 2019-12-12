# frozen_string_literal: true

FactoryBot.define do
  factory :music_genre do
    category { Faker::Name.unique.name }
  end
end
