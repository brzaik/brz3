class CreateBlog < ActiveRecord::Migration
  def up
    create_table "blog_categories", :force => true do |t|
      t.string "name"
    end
  
    create_table "blog_comments", :force => true do |t|
      t.integer  "blog_post_id"
      t.text     "body"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "moderated",       :default => false, :null => false
      t.string   "name"
      t.string   "email"
      t.string   "website"
      t.boolean  "posted_by_admin", :default => false, :null => false
    end
  
    create_table "blog_posts", :force => true do |t|
      t.string   "title"
      t.text     "body"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "user_id"
      t.integer  "blog_category_id"
      t.string   "slug"
      t.text     "excerpt"
    end
  end

  def down
    drop_table :blog_categories
    drop_table :blog_comments
    drop_table :blog_posts
  end
end
