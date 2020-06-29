# frozen_string_literal: true

# This will guess the User class
FactoryBot.define do
  factory :product do
    store
    image
    name { 'Some Name' }
    price { rand(100..300) }
    description { 'Lorem Ipsum' }
    ingredients { 'cheese, meat, pepper' }
    tags { 'hot, salty' }
  end
end
