# frozen_string_literal: true

ActiveAdmin.register OrderItem do
  actions :index

  scope(:all)
  scope(:news)
  scope(:in_progress)
  scope(:ready)

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

  filter :store

  member_action :cooking, method: :put do
    resource.update(status: :in_progress)
    redirect_to request.referer
  end

  member_action :finished, method: :put do
    resource.update(status: :ready)
    redirect_to request.referer
  end
end
