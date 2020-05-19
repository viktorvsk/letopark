# frozen_string_literal: true

class Order < ApplicationRecord
  after_initialize :build_new_order

  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  validates :code, presence: true
  validates :comment, exclusion: { in: [nil] }

  private

  def build_new_order
    self.code ||= SecureRandom.alphanumeric(5)
  end
end
