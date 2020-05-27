# frozen_string_literal: true

class OrderSerializer < ActiveModel::Serializer
  attributes :comment, :code, :status, :readiness_percentage, :order_items

  def order_items
    ActiveModel::Serializer::CollectionSerializer.new(object.order_items).as_json
  end
end
