# frozen_string_literal: true

module Api
  module V1
    class OrdersController < ApiController
      before_action :set_current_device, only: %w[index create destroy]

      def create
        order = current_device.customer.orders.create!(comment: params[:order][:comment])
        params[:order][:items].each do |item|
          product = Product.find(item[:product][:id])
          item_params = { quantity: item[:qty], product: product, price: product.price, store: product.store, status: 'new' }
          order.order_items.create!(item_params)
        end

        render json: current_device.customer.orders.order('created_at DESC')
      end

      def index
        render json: current_device.customer.orders.includes(order_items: { product: :image }).order('created_at DESC')
      end

      def destroy
        order = current_device.customer.orders.find_by(code: params[:id])
        if order.update(status: 'canceled_by_customer')
          render json: current_device.customer.orders.order('created_at DESC')
        else
          render json: { errors: order.errors }, status: :unprocessable_entity
        end
      end
    end
  end
end
