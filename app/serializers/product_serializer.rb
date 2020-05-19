# frozen_string_literal: true

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :ingredients, :tags, :image

  def ingredients
    object.ingredients.to_s.split(', ').map(&:strip)
  end

  def tags
    object.tags.to_s.split(', ').map(&:strip)
  end

  def image
    object.image.attachment.url
  end
end
