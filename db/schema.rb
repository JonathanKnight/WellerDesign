# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120323184014) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["id"], :name => "index_categories_on_id", :unique => true

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "clients", ["id"], :name => "index_clients_on_id", :unique => true

  create_table "elements", :force => true do |t|
    t.integer  "estimate_id"
    t.integer  "item_id"
    t.decimal  "quantity",         :precision => 8, :scale => 2
    t.datetime "due_at"
    t.datetime "completed_at"
    t.datetime "deleted_at"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.text     "delivery_address"
  end

  add_index "elements", ["estimate_id"], :name => "index_elements_on_estimate_id"
  add_index "elements", ["id"], :name => "index_elements_on_id", :unique => true
  add_index "elements", ["item_id"], :name => "index_elements_on_item_id"

  create_table "estimates", :force => true do |t|
    t.string   "name"
    t.integer  "room_id"
    t.integer  "sale_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "estimates", ["id"], :name => "index_estimates_on_id", :unique => true
  add_index "estimates", ["room_id"], :name => "index_estimates_on_room_id"
  add_index "estimates", ["sale_id"], :name => "index_estimates_on_sale_id"

  create_table "invoices", :force => true do |t|
    t.integer  "job_id"
    t.datetime "sent_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "invoices", ["id"], :name => "index_invoices_on_id", :unique => true
  add_index "invoices", ["job_id"], :name => "index_invoices_on_job_id"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "supplier_id"
    t.integer  "category_id"
    t.decimal  "price_ex_vat",  :precision => 8, :scale => 2
    t.decimal  "price_inc_vat", :precision => 8, :scale => 2
    t.decimal  "quantity",      :precision => 8, :scale => 2
    t.string   "units"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "image"
    t.string   "reference"
  end

  add_index "items", ["category_id"], :name => "index_items_on_category_id"
  add_index "items", ["id"], :name => "index_items_on_id", :unique => true
  add_index "items", ["supplier_id"], :name => "index_items_on_supplier_id"

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.integer  "client_id"
    t.decimal  "markup",     :precision => 8, :scale => 2
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "jobs", ["client_id"], :name => "index_jobs_on_client_id"
  add_index "jobs", ["id"], :name => "index_jobs_on_id", :unique => true

  create_table "purchaseorders", :force => true do |t|
    t.integer  "supplier_id"
    t.datetime "sent_at"
    t.text     "instructions"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "purchaseorders", ["id"], :name => "index_purchaseorders_on_id", :unique => true
  add_index "purchaseorders", ["supplier_id"], :name => "index_purchaseorders_on_supplier_id"

  create_table "purchases", :force => true do |t|
    t.integer  "element_id"
    t.datetime "duedate"
    t.decimal  "quantity",          :precision => 8, :scale => 2
    t.decimal  "price_ex_vat",      :precision => 8, :scale => 2
    t.decimal  "price_inc_vat",     :precision => 8, :scale => 2
    t.datetime "completed_at"
    t.integer  "purchase_order_id"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  add_index "purchases", ["element_id"], :name => "index_purchases_on_element_id"
  add_index "purchases", ["id"], :name => "index_purchases_on_id", :unique => true
  add_index "purchases", ["purchase_order_id"], :name => "index_purchases_on_purchase_order_id"

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.integer  "job_id"
    t.decimal  "width",      :precision => 8, :scale => 2
    t.decimal  "length",     :precision => 8, :scale => 2
    t.decimal  "height",     :precision => 8, :scale => 2
    t.integer  "windows"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "rooms", ["id"], :name => "index_rooms_on_id", :unique => true
  add_index "rooms", ["job_id"], :name => "index_rooms_on_job_id"

  create_table "sales", :force => true do |t|
    t.decimal  "quantity",      :precision => 8, :scale => 2
    t.decimal  "price_ex_vat",  :precision => 8, :scale => 2
    t.decimal  "price_inc_vat", :precision => 8, :scale => 2
    t.integer  "invoice_id"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "sales", ["id"], :name => "index_sales_on_id", :unique => true
  add_index "sales", ["invoice_id"], :name => "index_sales_on_invoice_id"

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "suppliers", ["id"], :name => "index_suppliers_on_id", :unique => true

  create_table "templates", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "item_id"
    t.decimal  "quantity",   :precision => 8, :scale => 2
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "templates", ["id"], :name => "index_templates_on_id", :unique => true
  add_index "templates", ["item_id"], :name => "index_templates_on_item_id"

  create_table "timesheets", :force => true do |t|
    t.integer  "user_id"
    t.integer  "element_id"
    t.string   "description"
    t.datetime "opened_at"
    t.datetime "closed_at"
    t.boolean  "chargeable"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "timesheets", ["element_id"], :name => "index_timesheets_on_element_id"
  add_index "timesheets", ["id"], :name => "index_timesheets_on_id", :unique => true
  add_index "timesheets", ["user_id"], :name => "index_timesheets_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
