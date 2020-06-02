# frozen_string_literal: true

ActiveAdmin.register OrderItem do
  menu if: proc { current_admin_user.role == 'admin' }
  config.filters = false
  actions :index

  scope(:all)
  scope(:news, default: true)
  scope(:in_progress)
  scope(:ready)

  index do
    column :store_name
    column :display_name
    column :order
    column :order_comment
    column :created_at
    actions do |order_item|
      case order_item.status
      when 'new'
        item 'На кухне', cooking_admin_order_item_path(order_item), class: 'member_link', method: :put
      when 'in_progress'
        item 'Готово', finished_admin_order_item_path(order_item), class: 'member_link', method: :put
      end
    end
  end

  member_action :cooking, method: :put do
    resource.update(status: :in_progress)
    redirect_to request.referer
  end

  member_action :finished, method: :put do
    resource.update(status: :ready)
    redirect_to request.referer
  end
end
