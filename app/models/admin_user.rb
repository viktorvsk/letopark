# frozen_string_literal: true

class AdminUser < ApplicationRecord
  ROLES = %w[merchant waiter admin].freeze

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  validates :role, inclusion: { in: ROLES }

  has_many :stores, dependent: :nullify
  has_many :order_items, through: :stores

  def display_name
    email
  end
end
