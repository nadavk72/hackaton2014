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

ActiveRecord::Schema.define(version: 20140330145858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

  create_table "my_requests", force: true do |t|
    t.string   "client_id"
    t.string   "agent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "request_parameters"
    t.boolean  "is_valid"
    t.string   "country"
    t.string   "attack_type"
  end

  create_table "request_data", force: true do |t|
    t.date     "date"
    t.string   "client_id"
    t.string   "agent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
