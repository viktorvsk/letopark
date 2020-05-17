# frozen_string_literal: true

FactoryBot.define do
  factory :admin_user do
    email { "email-#{SecureRandom.hex}@example.com" }
    password { SecureRandom.hex }
  end
end
