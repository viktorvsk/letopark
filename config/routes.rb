# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  constraints format: :json do
    namespace :api do
      namespace :v1 do
        resources :stores, only: %w[index]
        resources :orders, only: %w[create index destroy]
        resource :verification_request, only: %w[update]
        resource :customer, only: %w[update]
      end
    end
  end
end

module ActiveAdmin
  module Devise
    class SessionsController
      def after_sign_in_path_for(resource)
        case resource.role
        when 'merchant' then '/admin/order_items'
        when 'waiter' then '/admin/orders'
        when 'admin' then '/admin'
        else super
        end
      end

      def after_sign_out_path_for(_resource)
        '/admin'
      end
    end
  end
end
