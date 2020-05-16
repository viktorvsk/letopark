# frozen_string_literal: true

# This will guess the User class
FactoryBot.define do
  factory :order do
    customer
    code { SecureRandom.hex }
    comment { 'N/A' }
  end
end
