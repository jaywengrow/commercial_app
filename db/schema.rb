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

ActiveRecord::Schema.define(:version => 20110117163458) do

  create_table "commercials", :force => true do |t|
    t.text     "transcript"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "closed",     :default => false
    t.string   "title"
  end

  add_index "commercials", ["user_id"], :name => "index_commercials_on_user_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "commercial_id"
    t.integer  "vote_total"
    t.boolean  "winner",        :default => false
    t.string   "video_id"
  end

  add_index "posts", ["commercial_id"], :name => "index_posts_on_commercial_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"
  add_index "posts", ["video_id"], :name => "index_posts_on_video_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
    t.boolean  "business_user",      :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
  end

  add_index "votes", ["post_id"], :name => "index_votes_on_post_id"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

end
