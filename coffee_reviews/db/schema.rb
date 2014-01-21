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

ActiveRecord::Schema.define(version: 20140121020210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coffee_beans", force: true do |t|
    t.string   "name",       null: false
    t.datetime "roasted_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "roaster_id"
    t.integer  "origin_id"
  end

  create_table "origins", force: true do |t|
    t.string   "name"
    t.string   "country",    limit: 3
    t.integer  "elevation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roasters", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasting_notes", force: true do |t|
    t.text     "aroma"
    t.text     "mouthfeel"
    t.text     "acidity"
    t.text     "flavor"
    t.text     "finish"
    t.integer  "coffee_bean_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
