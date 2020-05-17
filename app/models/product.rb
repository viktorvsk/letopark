# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :store

  has_one :image, as: :imageable, dependent: :destroy, autosave: true

  validates :name, :price, :description, :attachment, presence: true
  validates :price, numericality: { integer: true }
  validates_associated :image

  delegate :attachment, to: :image, allow_nil: true

  def attachment=(value)
    (image || build_image).update(attachment: value)
  end
end
