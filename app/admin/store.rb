# frozen_string_literal: true

ActiveAdmin.register Store do
  permit_params :name, :admin_user_id

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  show do
    attributes_table do
      row :name
    end
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :name
      f.input :admin_user
    end
    f.actions
  end
end
