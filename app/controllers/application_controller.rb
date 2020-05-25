# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def access_denied(_exception)
    return redirect_to('/admin') unless current_admin_user

    case current_admin_user.role
    when 'merchant' then redirect_to('/admin/order_items')
    when 'waiter' then redirect_to('/admin/orders')
    when 'admin' then redirect_to('/admin')
    else raise
    end
  end
end
