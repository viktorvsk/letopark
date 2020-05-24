# frozen_string_literal: true

ActiveAdmin.register OrderItem do
  menu if: proc { current_admin_user.role == 'admin' }
  config.filters = false
  actions :index

  scope(:all)
  scope(:news, default: true)
  scope(:in_progress)
  scope(:ready)

  controller do
    # def scoped_collection
    #   case current_admin_user.role
    #   when 'merchant' then current_admin_user.order_items
    #   when 'waiter' then OrderItem.none
    #   when 'admin' then OrderItem.all
    #   end
    # end
  end

  index do
    column 'Точка', &:store_name
    column 'Заказ', &:display_name
    column 'Номер Заказа', &:order
    column 'Комментарий', &:order_comment
    column 'Время', &:created_at
    actions do |order_item|
      item 'На кухне', cooking_admin_order_item_path(order_item), class: 'member_link', method: :put if order_item.status == 'new'
      item 'Готово', finished_admin_order_item_path(order_item), class: 'member_link', method: :put if order_item.status == 'in_progress'
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
