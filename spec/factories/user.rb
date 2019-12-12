# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Name.unique.name }
    email { "#{Faker::Name.unique.name}@mail.com" }
    password { '123456' }
  end
end
