# frozen_string_literal: true

# This will guess the User class
FactoryBot.define do
  factory :product do
    store
    image
    name { 'Some Name' }
    price { rand(300) }
    description { 'Lorem Ipsum' }
  end
end
