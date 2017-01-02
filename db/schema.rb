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

ActiveRecord::Schema.define(version: 20170102180322) do

  create_table "clients", force: :cascade do |t|
    t.string   "first_name",  limit: 255,                 null: false
    t.string   "last_name",   limit: 255,                 null: false
    t.string   "email",       limit: 255,                 null: false
    t.string   "phone1",      limit: 255,                 null: false
    t.string   "phone2",      limit: 255
    t.boolean  "institution",             default: false, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "chip_id",    limit: 255
    t.string   "age",        limit: 255, null: false
    t.string   "breed",      limit: 255, null: false
    t.string   "sex",        limit: 1,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "client_id",  limit: 4
  end

  add_index "dogs", ["client_id"], name: "index_dogs_on_client_id", using: :btree

  create_table "donations", force: :cascade do |t|
    t.string   "transaction_id", limit: 255
    t.float    "amount",         limit: 24
    t.integer  "donator_id",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "donators", force: :cascade do |t|
    t.string   "first_name",  limit: 255
    t.string   "last_name",   limit: 255
    t.string   "email",       limit: 255
    t.string   "phone1",      limit: 255
    t.string   "phone2",      limit: 255
    t.boolean  "institution"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "line1",            limit: 255, null: false
    t.string   "line2",            limit: 255
    t.string   "city",             limit: 255, null: false
    t.string   "county",           limit: 255, null: false
    t.string   "code",             limit: 255
    t.float    "latitude",         limit: 24
    t.float    "longitude",        limit: 24
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "localizable_id",   limit: 4
    t.string   "localizable_type", limit: 255
  end

  add_index "locations", ["localizable_id", "localizable_type"], name: "index_locations_on_localizable_id_and_localizable_type", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.integer  "volunteer_id",        limit: 4
    t.integer  "volunteers_group_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "memberships", ["volunteer_id", "volunteers_group_id"], name: "index_memberships_on_volunteer_id_and_volunteers_group_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 255,                 null: false
    t.string   "last_name",       limit: 255,                 null: false
    t.string   "email",           limit: 255,                 null: false
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "ownership",                   default: false, null: false
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "first_name", limit: 255, null: false
    t.string   "last_name",  limit: 255, null: false
    t.string   "email",      limit: 255, null: false
    t.string   "phone1",     limit: 255, null: false
    t.string   "phone2",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "volunteers_groups", force: :cascade do |t|
    t.string   "name",        limit: 255,   null: false
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "dogs", "clients"
end
