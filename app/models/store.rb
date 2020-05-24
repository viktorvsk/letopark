# frozen_string_literal: true

class Store < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :order_items, dependent: :destroy

  belongs_to :admin_user, optional: true

  validates :name, presence: true, length: 1..25
end
