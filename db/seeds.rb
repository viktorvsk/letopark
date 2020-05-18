# frozen_string_literal: true

AdminUser.where(email: 'admin@example.com').first_or_create(password: 'password', password_confirmation: 'password')
store = Store.where(name: 'Burgerzzz').first_or_create
store.products.where(name: 'Typo Burger').first_or_create(price: 159, description: 'Very Tasty', ingredients: 'cheese, meat, bread', tags: 'spicy', attachment: File.open(Rails.root.join('spec/support/img.png')))
store.products.where(name: 'Pirate Burger').first_or_create(price: 259, description: 'Very Tasty', ingredients: 'cheese, meat, bread', tags: 'spicy', attachment: File.open(Rails.root.join('spec/support/img.png')))
store.products.where(name: 'Crazy Burger').first_or_create(price: 279, description: 'Very Tasty', ingredients: 'cheese, meat, bread', tags: 'spicy', attachment: File.open(Rails.root.join('spec/support/img.png')))
