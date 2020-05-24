# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      resources :stores, only: %w[index]
      resources :orders, only: %w[create index destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
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
