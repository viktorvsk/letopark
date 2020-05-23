# frozen_string_literal: true

class OrderItem < ApplicationRecord
  STATUSES = %w[new in_progress ready completed].freeze

  belongs_to :order
  belongs_to :product, optional: true
  belongs_to :store

  validates :quantity, :price, presence: true, numericality: { integer: true }
  validates :status, inclusion: { in: STATUSES }

  scope :news, -> { where(status: 'new') }
  scope :in_progress, -> { where(status: 'in_progress') }
  scope :ready, -> { where(status: 'ready') }
  scope :completed, -> { where(status: 'completed') }

  delegate :name, to: :store, prefix: true
  delegate :comment, to: :order, prefix: true

  def display_name
    "#{product.name} (#{quantity} шт.)"
  end

  def total
    product.price * quantity
  end
end
