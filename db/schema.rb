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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150511030624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "body",       null: false
    t.integer  "user_id",    null: false
    t.integer  "post_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "post_downvotes", force: :cascade do |t|
    t.integer  "post_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "post_downvotes", ["post_id", "user_id"], name: "index_post_downvotes_on_post_id_and_user_id", unique: true, using: :btree
  add_index "post_downvotes", ["post_id"], name: "index_post_downvotes_on_post_id", using: :btree
  add_index "post_downvotes", ["user_id"], name: "index_post_downvotes_on_user_id", using: :btree

  create_table "post_upvotes", force: :cascade do |t|
    t.integer  "post_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "post_upvotes", ["post_id", "user_id"], name: "index_post_upvotes_on_post_id_and_user_id", unique: true, using: :btree
  add_index "post_upvotes", ["post_id"], name: "index_post_upvotes_on_post_id", using: :btree
  add_index "post_upvotes", ["user_id"], name: "index_post_upvotes_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",                null: false
    t.string   "url"
    t.integer  "subreddit_id",         null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "post_upvotes_count"
    t.integer  "post_downvotes_count"
    t.integer  "user_id",              null: false
  end

  add_index "posts", ["subreddit_id"], name: "index_posts_on_subreddit_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "subreddits", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subreddits", ["name"], name: "index_subreddits_on_name", unique: true, using: :btree
  add_index "subreddits", ["user_id"], name: "index_subreddits_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "post_downvotes", "posts"
  add_foreign_key "post_downvotes", "users"
  add_foreign_key "post_upvotes", "posts"
  add_foreign_key "post_upvotes", "users"
  add_foreign_key "posts", "subreddits"
  add_foreign_key "posts", "users"
  add_foreign_key "subreddits", "users"
end
