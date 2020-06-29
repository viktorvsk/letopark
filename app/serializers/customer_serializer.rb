# frozen_string_literal: true

class CustomerSerializer < ActiveModel::Serializer
  attributes :name, :phone
end
