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

ActiveRecord::Schema.define(version: 20170428134355) do

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

  create_table "clients_custom_events", id: false, force: :cascade do |t|
    t.integer "client_id",       limit: 4, null: false
    t.integer "custom_event_id", limit: 4, null: false
  end

  add_index "clients_custom_events", ["client_id", "custom_event_id"], name: "index_clients_custom_events_on_client_id_and_custom_event_id", using: :btree
  add_index "clients_custom_events", ["custom_event_id", "client_id"], name: "index_clients_custom_events_on_custom_event_id_and_client_id", using: :btree

  create_table "custom_events", force: :cascade do |t|
    t.text     "description", limit: 65535, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "event_id",    limit: 4
  end

  add_index "custom_events", ["event_id"], name: "index_custom_events_on_event_id", using: :btree

  create_table "custom_events_dogs", id: false, force: :cascade do |t|
    t.integer "dog_id",          limit: 4, null: false
    t.integer "custom_event_id", limit: 4, null: false
  end

  add_index "custom_events_dogs", ["custom_event_id", "dog_id"], name: "index_custom_events_dogs_on_custom_event_id_and_dog_id", using: :btree
  add_index "custom_events_dogs", ["dog_id", "custom_event_id"], name: "index_custom_events_dogs_on_dog_id_and_custom_event_id", using: :btree

  create_table "custom_events_events", id: false, force: :cascade do |t|
    t.integer "event_id",        limit: 4, null: false
    t.integer "custom_event_id", limit: 4, null: false
  end

  add_index "custom_events_events", ["custom_event_id", "event_id"], name: "index_custom_events_events_on_custom_event_id_and_event_id", using: :btree
  add_index "custom_events_events", ["event_id", "custom_event_id"], name: "index_custom_events_events_on_event_id_and_custom_event_id", using: :btree

  create_table "custom_events_volunteers", id: false, force: :cascade do |t|
    t.integer "volunteer_id",    limit: 4, null: false
    t.integer "custom_event_id", limit: 4, null: false
  end

  add_index "custom_events_volunteers", ["custom_event_id", "volunteer_id"], name: "index_custom_events_on_vol_id", using: :btree
  add_index "custom_events_volunteers", ["volunteer_id", "custom_event_id"], name: "index_custom_events_on_cust_eve_id", using: :btree

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

  create_table "events", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "title",      limit: 255
    t.string   "color",      limit: 255
  end

  create_table "events_visits", id: false, force: :cascade do |t|
    t.integer "event_id", limit: 4, null: false
    t.integer "visit_id", limit: 4, null: false
  end

  add_index "events_visits", ["event_id", "visit_id"], name: "index_events_visits_on_event_id_and_visit_id", using: :btree
  add_index "events_visits", ["visit_id", "event_id"], name: "index_events_visits_on_visit_id_and_event_id", using: :btree

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

  create_table "notes", force: :cascade do |t|
    t.text     "content",      limit: 65535
    t.integer  "notable_id",   limit: 4
    t.string   "notable_type", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "notes", ["notable_type", "notable_id"], name: "index_notes_on_notable_type_and_notable_id", using: :btree

  create_table "plutus_accounts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "type",       limit: 255
    t.boolean  "contra"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code",       limit: 255
  end

  add_index "plutus_accounts", ["code"], name: "index_plutus_accounts_on_code", using: :btree
  add_index "plutus_accounts", ["name", "type"], name: "index_plutus_accounts_on_name_and_type", using: :btree
  add_index "plutus_accounts", ["name"], name: "index_plutus_accounts_on_name", using: :btree

  create_table "plutus_amounts", force: :cascade do |t|
    t.string  "type",       limit: 255
    t.integer "account_id", limit: 4
    t.integer "entry_id",   limit: 4
    t.decimal "amount",                 precision: 20, scale: 10
  end

  add_index "plutus_amounts", ["account_id", "entry_id"], name: "index_plutus_amounts_on_account_id_and_entry_id", using: :btree
  add_index "plutus_amounts", ["entry_id", "account_id"], name: "index_plutus_amounts_on_entry_id_and_account_id", using: :btree
  add_index "plutus_amounts", ["type"], name: "index_plutus_amounts_on_type", using: :btree

  create_table "plutus_entries", force: :cascade do |t|
    t.string   "description",              limit: 255
    t.date     "date"
    t.integer  "commercial_document_id",   limit: 4
    t.string   "commercial_document_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plutus_entries", ["commercial_document_id", "commercial_document_type"], name: "index_entries_on_commercial_doc", using: :btree
  add_index "plutus_entries", ["date"], name: "index_plutus_entries_on_date", using: :btree

  create_table "tracelogs", force: :cascade do |t|
    t.string "trace_id",   limit: 255, null: false
    t.string "user_name",  limit: 255, null: false
    t.string "trace_type", limit: 255, null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.boolean  "dog_dog"
    t.boolean  "dog_human"
    t.boolean  "no_attachment"
    t.boolean  "ignore_calling"
    t.boolean  "no_heel"
    t.boolean  "toilet_home"
    t.boolean  "bite_furniture"
    t.text     "other",          limit: 65535
    t.integer  "event_id",       limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "dog_id",         limit: 4
    t.integer  "volunteer_id",   limit: 4
  end

  add_index "trainings", ["dog_id"], name: "index_trainings_on_dog_id", using: :btree
  add_index "trainings", ["event_id"], name: "index_trainings_on_event_id", using: :btree
  add_index "trainings", ["volunteer_id"], name: "index_trainings_on_volunteer_id", using: :btree

  create_table "transfers", force: :cascade do |t|
    t.integer  "dog_id",       limit: 4
    t.integer  "sender_id",    limit: 4
    t.integer  "recipient_id", limit: 4
    t.integer  "volunteer_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "event_id",     limit: 4
  end

  add_index "transfers", ["dog_id"], name: "index_transfers_on_dog_id", using: :btree
  add_index "transfers", ["event_id"], name: "index_transfers_on_event_id", using: :btree
  add_index "transfers", ["recipient_id"], name: "index_transfers_on_recipient_id", using: :btree
  add_index "transfers", ["sender_id"], name: "index_transfers_on_sender_id", using: :btree
  add_index "transfers", ["volunteer_id"], name: "index_transfers_on_volunteer_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 255,                 null: false
    t.string   "last_name",       limit: 255,                 null: false
    t.string   "email",           limit: 255,                 null: false
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "ownership",                   default: false, null: false
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "volunteer_id", limit: 4
    t.integer  "client_id",    limit: 4
    t.integer  "event_id",     limit: 4
  end

  add_index "visits", ["client_id"], name: "index_visits_on_client_id", using: :btree
  add_index "visits", ["event_id"], name: "index_visits_on_event_id", using: :btree
  add_index "visits", ["volunteer_id"], name: "index_visits_on_volunteer_id", using: :btree

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

  add_foreign_key "custom_events", "events"
  add_foreign_key "dogs", "clients"
  add_foreign_key "trainings", "dogs"
  add_foreign_key "trainings", "events"
  add_foreign_key "trainings", "volunteers"
  add_foreign_key "transfers", "dogs"
  add_foreign_key "transfers", "events"
  add_foreign_key "transfers", "volunteers"
  add_foreign_key "visits", "clients"
  add_foreign_key "visits", "events"
  add_foreign_key "visits", "volunteers"
end
