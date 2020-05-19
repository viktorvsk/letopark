# frozen_string_literal: true

class OrderItemSerializer < ActiveModel::Serializer
  attributes :quantity, :product

  def product
    ProductSerializer.new(object.product).as_json
  end
end
