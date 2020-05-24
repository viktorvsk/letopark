# frozen_string_literal: true

ActiveAdmin.register AdminUser do
  permit_params :role, :email, :password

  index do
    column :email
    column :role
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :role
      row :created_at
    end
  end

  filter :email
  filter :role
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :role, as: :select, collection: %w[admin merchant waiter], include_blank: false
    end
    f.actions
  end
end
