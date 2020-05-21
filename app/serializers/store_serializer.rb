# frozen_string_literal: true

class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :products

  def products
    ActiveModel::Serializer::CollectionSerializer.new(object.products).as_json
  end
end
