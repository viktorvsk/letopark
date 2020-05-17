# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base
  storage Rails.env.test? ? nil : :fog

  def size_range
    0..2.megabytes
  end

  def extension_whitelist
    %w[jpg jpeg png]
  end

  def content_type_whitelist
    [%r{image/}]
  end

  def default_url(*_args)
    '/default_image.png'
  end

  def store_dir
    "uploads/#{model.imageable.class.name.downcase}/images/#{model.id}"
  end
end
