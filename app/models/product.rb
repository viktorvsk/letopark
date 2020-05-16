# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :store
  validates :name, :price, :description, presence: true
  validates :price, numericality: { integer: true }
end
