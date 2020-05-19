# frozen_string_literal: true

class OrderSerializer < ActiveModel::Serializer
  attributes :comment, :code, :order_items

  def order_items
    ActiveModel::Serializer::CollectionSerializer.new(object.order_items).as_json
  end
end
