# frozen_string_literal: true

module Api
  module V1
    class CustomersController < ApiController
      before_action :set_current_device, only: %w[update]

      def update
        if current_device.customer.update(customer_params)
          render json: current_device.customer
        else
          render json: { errors: current_device.customer.errors }, status: :unprocessable_entity
        end
      end

      private

      def customer_params
        params.require(:customer).permit(:name, :phone, :verification_code)
      end
    end
  end
end
