# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :name, :price, :description, :store_id

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :description
    column :store
  end

  show do
    attributes_table do
      row :name
      row :price
      row :description
      row :store
    end
  end

  filter :name
  filter :price
  filter :store

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :description
      f.input :store
    end
    f.actions
  end
end
