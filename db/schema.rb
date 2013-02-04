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

ActiveRecord::Schema.define(:version => 20130204205950) do

  create_table "announcements", :force => true do |t|
    t.string   "name"
    t.boolean  "front_page"
    t.boolean  "site_wide"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "live"
    t.text     "body"
  end

  create_table "blurbs", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "page_id"
    t.boolean  "front_page"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "page_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "file"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.date     "starts_at"
    t.date     "ends_at"
  end

  create_table "images", :force => true do |t|
    t.string   "name"
    t.string   "picture"
    t.integer  "priority"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "page_id"
    t.boolean  "featured"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "parent_id"
    t.boolean  "public"
    t.integer  "priority"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.string   "colors"
    t.string   "sizes"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "salt"
    t.string   "crypted_password"
    t.string   "name"
    t.boolean  "admin"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
