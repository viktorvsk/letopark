# frozen_string_literal: true

module Api
  module V1
    class StoresController < ActionController::API
      def index
        render json: Store.all, include: :products
      end
    end
  end
end
