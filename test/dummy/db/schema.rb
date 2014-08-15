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

ActiveRecord::Schema.define(:version => 20140814010018) do

  create_table "all_field_types", :force => true do |t|
    t.string   "string_field"
    t.string   "mask_field"
    t.string   "permalink_field"
    t.string   "email_field"
    t.string   "pdf_field"
    t.string   "file_field"
    t.string   "image_field"
    t.string   "password_field"
    t.string   "select_field"
    t.string   "radio_field"
    t.boolean  "checkbox_field"
    t.date     "date_field"
    t.time     "time_field"
    t.datetime "timestamp_field"
    t.datetime "datetime_field"
    t.decimal  "currency_field"
    t.float    "float_field"
    t.decimal  "decimal_field"
    t.integer  "integer_field"
    t.text     "text_field"
    t.text     "wysi_field"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "one_fields", :force => true do |t|
    t.string   "string_field"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "one_image_fields", :force => true do |t|
    t.string   "image_field"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
