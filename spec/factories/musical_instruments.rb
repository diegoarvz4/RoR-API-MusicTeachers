# frozen_string_literal: true

FactoryBot.define do
  factory :musical_instrument do
    kind { Faker::Name.unique.name }
  end
end
