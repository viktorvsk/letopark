# frozen_string_literal: true

module Api
  module V1
    class StoresController < ActionController::API
      def index
        render json: Store.includes(:products)
      end
    end
  end
end
