# frozen_string_literal: true

# This will guess the User class
FactoryBot.define do
  factory :order_item do
    order
    quantity { rand(5) }
    status { 'new' }
    store
    price { rand(300) }
  end
end
