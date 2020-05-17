# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :name, :price, :description, :store_id, :attachment

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :description
    column :store
    actions
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
      f.input :description, as: :text
      f.input :attachment, as: :file, hint: (f.object.attachment && image_tag(f.object.attachment.url))
      f.input :store, include_blank: false
    end
    f.actions
  end
end
