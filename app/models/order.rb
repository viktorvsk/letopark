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

  scope :news, -> { where(status: 'new') }
  scope :in_progress, -> { where(status: 'in_progress') }
  scope :ready, -> { where(status: 'ready') }
  scope :completed, -> { where(status: 'completed') }

  def display_name
    id
  end

  def readiness
    "#{order_items.news.count} / #{order_items.in_progress.count} / #{order_items.ready.count}"
  end

  private

  def build_new_order
    self.code ||= SecureRandom.alphanumeric(5)
    self.status ||= 'new'
  end
end
