# frozen_string_literal: true

ActiveAdmin.register Store do
  permit_params :name

  index do
    selectable_column
    id_column
    column :name
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
    end
    f.actions
  end
end
