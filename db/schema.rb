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

ActiveRecord::Schema.define(:version => 20130113192206) do

  create_table "blocks", :force => true do |t|
    t.string   "content_name"
    t.integer  "position"
    t.integer  "section_id"
    t.string   "additional_styles"
    t.string   "additional_tags"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "images", :force => true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.integer  "position"
    t.string   "url_link"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "upload_id"
    t.string   "caption"
  end

  create_table "links", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "linkable_id"
    t.string   "linkable_type"
    t.string   "caption"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "is_highlight"
    t.integer  "template_id"
    t.string   "slug"
    t.string   "meta_description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug", :unique => true

  create_table "pages_tags", :id => false, :force => true do |t|
    t.integer "page_id"
    t.integer "tag_id"
  end

  create_table "quotes", :force => true do |t|
    t.string   "author"
    t.text     "quote"
    t.string   "concatenated_quote"
    t.integer  "quoteable_id"
    t.string   "quoteable_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "richtexts", :force => true do |t|
    t.integer  "block_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sections", :force => true do |t|
    t.integer  "page_id"
    t.integer  "position"
    t.string   "additional_styles"
    t.string   "additional_tags"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "templates", :force => true do |t|
    t.string   "template_name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "twitter_boards", :force => true do |t|
    t.string   "account_name"
    t.integer  "display_num"
    t.integer  "block_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "uploads", :force => true do |t|
    t.string   "myfile_file_name"
    t.string   "myfile_content_type"
    t.integer  "myfile_file_size"
    t.datetime "myfile_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.boolean  "view_as_admin",          :default => true
    t.boolean  "approved"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "videoable_id"
    t.string   "videoable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
