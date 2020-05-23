# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_522_210_721) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_admin_comments', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.string 'author_type'
    t.bigint 'author_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author_type_and_author_id'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource_type_and_resource_id'
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'customers', force: :cascade do |t|
    t.string 'name'
    t.integer 'phone'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'devices', force: :cascade do |t|
    t.bigint 'customer_id', null: false
    t.string 'access_token', null: false
    t.string 'refresh_token', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['customer_id'], name: 'index_devices_on_customer_id'
  end

  create_table 'images', force: :cascade do |t|
    t.string 'attachment', null: false
    t.bigint 'imageable_id', null: false
    t.string 'imageable_type', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[imageable_type imageable_id], name: 'index_images_on_imageable_type_and_imageable_id'
  end

  create_table 'order_items', force: :cascade do |t|
    t.bigint 'order_id', null: false
    t.bigint 'product_id'
    t.integer 'quantity', null: false
    t.integer 'price', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'status', null: false
    t.integer 'store_id', null: false
    t.index ['order_id'], name: 'index_order_items_on_order_id'
    t.index ['product_id'], name: 'index_order_items_on_product_id'
    t.index ['status'], name: 'index_order_items_on_status'
    t.index ['store_id'], name: 'index_order_items_on_store_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.bigint 'customer_id', null: false
    t.string 'code', null: false
    t.string 'comment', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'status', null: false
    t.index ['customer_id'], name: 'index_orders_on_customer_id'
    t.index ['status'], name: 'index_orders_on_status'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'price', null: false
    t.string 'description', null: false
    t.bigint 'store_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'ingredients'
    t.string 'tags'
    t.index ['store_id'], name: 'index_products_on_store_id'
  end

  create_table 'stores', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'devices', 'customers'
  add_foreign_key 'order_items', 'orders'
  add_foreign_key 'order_items', 'stores'
  add_foreign_key 'orders', 'customers'
  add_foreign_key 'products', 'stores'
end
