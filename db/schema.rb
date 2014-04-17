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

ActiveRecord::Schema.define(version: 20140417202849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "linkedin_oauth_settings", force: true do |t|
    t.string   "atoken"
    t.string   "asecret"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "linkedin_oauth_settings", ["user_id"], name: "index_linkedin_oauth_settings_on_user_id", using: :btree

  create_table "proficiencies", force: true do |t|
    t.integer  "talent_profile_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proficiencies", ["skill_id"], name: "index_proficiencies_on_skill_id", using: :btree
  add_index "proficiencies", ["talent_profile_id"], name: "index_proficiencies_on_talent_profile_id", using: :btree

  create_table "skills", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talent_profiles", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "industry"
    t.text     "summary"
    t.integer  "talent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "talent_profiles", ["talent_id"], name: "index_talent_profiles_on_talent_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
