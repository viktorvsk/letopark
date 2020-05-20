# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true, autosave: true
  mount_uploader :attachment, ImageUploader
  validates :imageable, presence: true
end
