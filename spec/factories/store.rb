# frozen_string_literal: true

# This will guess the User class
FactoryBot.define do
  factory :store do
    name { "Store-#{SecureRandom.uuid}" }
  end
end
