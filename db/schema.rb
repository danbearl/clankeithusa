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

ActiveRecord::Schema.define(:version => 20130908170635) do

  create_table "announcements", :force => true do |t|
    t.string   "name"
    t.boolean  "site_wide"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "live"
    t.text     "body"
  end

  create_table "applicants", :force => true do |t|
    t.string  "type"
    t.string  "address"
    t.string  "city"
    t.string  "state"
    t.string  "zip"
    t.string  "email"
    t.string  "applicant_first_name"
    t.string  "applicant_last_name"
    t.date    "applicant_birth_date"
    t.string  "applicant_birth_place"
    t.date    "applicant_marriage_date"
    t.string  "applicant_marriage_place"
    t.string  "spouse_first_name"
    t.string  "spouse_last_name"
    t.date    "spouse_birth_date"
    t.string  "spouse_birth_place"
    t.date    "spouse_death_date"
    t.string  "spouse_death_place"
    t.string  "father_first_name"
    t.string  "father_last_name"
    t.date    "father_birth_date"
    t.string  "father_birth_place"
    t.date    "father_death_date"
    t.string  "father_death_place"
    t.date    "parents_marriage_date"
    t.string  "parents_marriage_place"
    t.string  "mother_first_name"
    t.string  "mother_last_name"
    t.date    "mother_birth_date"
    t.string  "mother_birth_place"
    t.date    "mother_death_date"
    t.string  "mother_death_place"
    t.string  "grandfather_first_name"
    t.string  "grandfather_last_name"
    t.date    "grandfather_birth_date"
    t.string  "grandfather_birth_place"
    t.date    "grandfather_death_date"
    t.string  "grandfather_death_place"
    t.date    "grandparents_marriage_date"
    t.string  "grandparents_marriage_place"
    t.string  "grandmother_first_name"
    t.string  "grandmother_last_name"
    t.date    "grandmother_birth_date"
    t.string  "grandmother_birth_place"
    t.date    "grandmother_death_date"
    t.string  "grandmother_death_place"
    t.string  "ancestor_1a_first_name"
    t.string  "ancestor_1a_last_name"
    t.date    "ancestor_1a_birth_date"
    t.string  "ancestor_1a_birth_place"
    t.date    "ancestor_1a_death_date"
    t.string  "ancestor_1a_death_place"
    t.date    "ancestor_1_marriage_date"
    t.string  "ancestor_1_marriage_place"
    t.string  "ancestor_1b_first_name"
    t.string  "ancestor_1b_last_name"
    t.date    "ancestor_1b_birth_date"
    t.string  "ancestor_1b_birth_place"
    t.date    "ancestor_1b_death_date"
    t.string  "ancestor_1b_death_place"
    t.string  "ancestor_2a_first_name"
    t.string  "ancestor_2a_last_name"
    t.date    "ancestor_2a_birth_date"
    t.string  "ancestor_2a_birth_place"
    t.date    "ancestor_2a_death_date"
    t.string  "ancestor_2a_death_place"
    t.date    "ancestor_2_marriage_date"
    t.string  "ancestor_2_marriage_place"
    t.string  "ancestor_2b_first_name"
    t.string  "ancestor_2b_last_name"
    t.date    "ancestor_2b_birth_date"
    t.string  "ancestor_2b_birth_place"
    t.date    "ancestor_2b_death_date"
    t.string  "ancestor_2b_death_place"
    t.string  "ancestor_3a_first_name"
    t.string  "ancestor_3a_last_name"
    t.date    "ancestor_3a_birth_date"
    t.string  "ancestor_3a_birth_place"
    t.date    "ancestor_3a_death_date"
    t.string  "ancestor_3a_death_place"
    t.date    "ancestor_3_marriage_date"
    t.string  "ancestor_3_marriage_place"
    t.string  "ancestor_3b_first_name"
    t.string  "ancestor_3b_last_name"
    t.date    "ancestor_3b_birth_date"
    t.string  "ancestor_3b_birth_place"
    t.date    "ancestor_3b_death_date"
    t.string  "ancestor_3b_death_place"
    t.string  "ancestor_4a_first_name"
    t.string  "ancestor_4a_last_name"
    t.date    "ancestor_4a_birth_date"
    t.string  "ancestor_4a_birth_place"
    t.date    "ancestor_4a_death_date"
    t.string  "ancestor_4a_death_place"
    t.date    "ancestor_4_marriage_date"
    t.string  "ancestor_4_marriage_place"
    t.string  "ancestor_4b_first_name"
    t.string  "ancestor_4b_last_name"
    t.date    "ancestor_4b_birth_date"
    t.string  "ancestor_4b_birth_place"
    t.date    "ancestor_4b_death_date"
    t.string  "ancestor_4b_death_place"
    t.string  "ancestor_5a_first_name"
    t.string  "ancestor_5a_last_name"
    t.date    "ancestor_5a_birth_date"
    t.string  "ancestor_5a_birth_place"
    t.date    "ancestor_5a_death_date"
    t.string  "ancestor_5a_death_place"
    t.date    "ancestor_5_marriage_date"
    t.string  "ancestor_5_marriage_place"
    t.string  "ancestor_5b_first_name"
    t.string  "ancestor_5b_last_name"
    t.date    "ancestor_5b_birth_date"
    t.string  "ancestor_5b_birth_place"
    t.date    "ancestor_5b_death_date"
    t.string  "ancestor_5b_death_place"
    t.integer "subtotal"
    t.integer "shipping"
    t.string  "stripe_payment_token"
  end

  create_table "blurb_associations", :force => true do |t|
    t.integer  "page_id"
    t.integer  "blurb_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "blurbs", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "page_id"
    t.boolean  "front_page"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.string   "author"
    t.boolean  "approved"
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

  create_table "orders", :force => true do |t|
    t.string   "email"
    t.string   "customer_first_name"
    t.string   "customer_last_name"
    t.string   "address_street_1"
    t.string   "address_street_2"
    t.string   "address_city"
    t.string   "address_state"
    t.string   "address_zip"
    t.boolean  "processed"
    t.boolean  "shipped"
    t.text     "notes"
    t.text     "products"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "stripe_payment_token"
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
    t.string   "category"
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
