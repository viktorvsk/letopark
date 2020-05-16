# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product, optional: true
  validates :quantity, :price, presence: true, numericality: { integer: true }
end
