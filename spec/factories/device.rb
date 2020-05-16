# frozen_string_literal: true

# This will guess the User class
FactoryBot.define do
  factory :device do
    customer
    access_token { SecureRandom.uuid }
    refresh_token { SecureRandom.uuid }
  end
end
