# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    date { Faker::Date.forward(days: 23) }
  end
end
