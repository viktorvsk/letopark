# frozen_string_literal: true

module Api
  module V1
    class OrdersController < ApiController
      before_action :set_current_device, only: %w[index create]

      def create
        order = current_device.customer.orders.create!(comment: params[:order][:comment])
        params[:order][:items].each do |item|
          item_params = { quantity: item[:qty], product_id: item[:product][:id], price: item[:product][:price] }
          order.order_items.create!(item_params)
        end

        render json: current_device.customer.orders
      end

      def index
        render json: current_device.customer.orders
      end
    end
  end
end
