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

ActiveRecord::Schema.define(version: 20170414140756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "collegials", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decisions", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "collegial_id"
    t.integer  "type_decision_id"
    t.date     "date_d"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["collegial_id"], name: "index_decisions_on_collegial_id", using: :btree
    t.index ["project_id"], name: "index_decisions_on_project_id", using: :btree
    t.index ["type_decision_id"], name: "index_decisions_on_type_decision_id", using: :btree
  end

  create_table "financial_indicators", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "indicator_values", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "indicator_id"
    t.string   "value"
    t.date     "date_i"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["indicator_id"], name: "index_indicator_values_on_indicator_id", using: :btree
    t.index ["project_id"], name: "index_indicator_values_on_project_id", using: :btree
  end

  create_table "inflows_outflows", force: :cascade do |t|
    t.integer  "movement_id"
    t.integer  "project_id"
    t.decimal  "total"
    t.date     "date_f"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["movement_id"], name: "index_inflows_outflows_on_movement_id", using: :btree
    t.index ["project_id"], name: "index_inflows_outflows_on_project_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "currency"
    t.date     "date_p"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_of_activities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_of_decisions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_of_movements", force: :cascade do |t|
    t.string   "name"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_type_of_movements_on_activity_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "decisions", "collegials"
  add_foreign_key "decisions", "projects"
  add_foreign_key "decisions", "type_of_decisions", column: "type_decision_id"
  add_foreign_key "indicator_values", "financial_indicators", column: "indicator_id"
  add_foreign_key "indicator_values", "projects"
  add_foreign_key "inflows_outflows", "projects"
  add_foreign_key "inflows_outflows", "type_of_movements", column: "movement_id"
  add_foreign_key "type_of_movements", "type_of_activities", column: "activity_id"
end
