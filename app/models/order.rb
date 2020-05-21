# frozen_string_literal: true

class Order < ApplicationRecord
  STATUSES = %w[
    new
    in_progress
    ready
    completed
    canceled_by_customer
    canceled_by_waiter
  ].freeze

  after_initialize :build_new_order

  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  validates :code, presence: true
  validates :comment, exclusion: { in: [nil] }
  validates :status, inclusion: { in: STATUSES }

  private

  def build_new_order
    self.code ||= SecureRandom.alphanumeric(5)
    self.status ||= 'new'
  end
end
