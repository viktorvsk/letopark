# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :store

  has_one :image, as: :imageable, dependent: :destroy, autosave: true

  validates :name, :price, :description, :attachment, presence: true
  validates :name, length: 1..50
  validates :description, length: 1..180
  validates :price, numericality: { integer: true, greater_than: 1 }
  validates_associated :image

  delegate :attachment, to: :image, allow_nil: true

  def attachment=(value)
    (image || build_image).update(attachment: value)
  end
end
