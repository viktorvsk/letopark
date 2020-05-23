# frozen_string_literal: true

class Store < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :order_items, dependent: :destroy
  validates :name, presence: true, length: 1..25
end
