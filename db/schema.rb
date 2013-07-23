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

ActiveRecord::Schema.define(version: 20130723052205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "github_access_token"
    t.string   "github_id"
    t.string   "twitter_oauth_token"
    t.string   "twitter_oauth_token_secret"
    t.string   "twitter_id"
    t.string   "remember_me_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["github_access_token"], name: "index_users_on_github_access_token", using: :btree
  add_index "users", ["github_id"], name: "index_users_on_github_id", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["twitter_id"], name: "index_users_on_twitter_id", unique: true, using: :btree
  add_index "users", ["twitter_oauth_token"], name: "index_users_on_twitter_oauth_token", using: :btree
  add_index "users", ["twitter_oauth_token_secret"], name: "index_users_on_twitter_oauth_token_secret", using: :btree

end
