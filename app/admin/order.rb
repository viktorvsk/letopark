# frozen_string_literal: true

ActiveAdmin.register Order do
  actions :index, :show

  scope(:all)
  scope(:news)
  scope(:in_progress)
  scope(:ready)

  filter :status

  index do
    id_column
    column 'Комментарий', &:comment
    column 'Готовность (в очереди/на кухне/готов)', &:readiness
    column 'Время', &:created_at
    column :status
    actions do |order|
      item 'На кухне', cooking_admin_order_path(order), class: 'member_link', method: :put if order.status == 'new'
      item 'Готово', finished_admin_order_path(order), class: 'member_link', method: :put if order.status == 'in_progress'
    end
  end

  action_item :paid, only: :show do
    link_to 'Оплачено', paid_admin_order_path(order), method: :put if order.status == 'ready'
  end

  action_item :cancel, only: :show do
    link_to 'Отменить', cancel_admin_order_path(order), method: :delete if order.status.in?(%w[new in_progress ready])
  end

  show do
    h2 order.customer.name if order.customer.name.present?
    h4 order.created_at.strftime('%e %B %X')

    panel "Заказ (#{order.status})" do
      table_for order.order_items.includes(:product) do
        column :product
        column :quantity
        column :status
        column :price
        column :total, &:total
      end
    end

    if order.comment.present?
      panel 'Комментарий' do
        order.comment
      end
      hr
    end

    panel 'К оплате' do
      "#{order.order_items.map { |oi| oi.product.price * oi.quantity }.sum} грн."
    end
  end

  member_action :code, method: :get do
    order = Order.find_by(code: params[:id])
    redirect_to admin_order_path(order.id)
  end

  member_action :cooking, method: :put do
    resource.update(status: :in_progress)
    redirect_to request.referer
  end

  member_action :cancel, method: :delete do
    resource.update(status: :canceled_by_waiter)
    redirect_to request.referer
  end

  member_action :paid, method: :put do
    resource.update(status: :completed)
    redirect_to request.referer
  end

  member_action :finished, method: :put do
    resource.update(status: :ready)
    redirect_to request.referer
  end
end
