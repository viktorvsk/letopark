# frozen_string_literal: true

ActiveAdmin.register AdminUser do
  permit_params :role, :email, :password

  index do
    column :email
    column :role do |admin_user|
      t("roles.#{admin_user.role}")
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :role do |admin_user|
        t("roles.#{admin_user.role}")
      end
      row :created_at
    end
  end

  filter :email
  filter :role
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :role, as: :select, collection: [[t('roles.admin'), :admin], [t('roles.waiter'), :waiter], [t('roles.merchant'), :merchant]], include_blank: false
    end
    f.actions
  end
end
