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

ActiveRecord::Schema.define(version: 20151208130319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password"
    t.string   "name"
    t.string   "surname"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "communities", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "project_id"
  end

  create_table "community_covers", force: :cascade do |t|
    t.integer  "species_id"
    t.float    "percentage_cover"
    t.float    "proportional_cover"
    t.integer  "count"
    t.float    "mean_canopy_diameter"
    t.float    "individual_per_hectare"
    t.float    "predicted_cover"
    t.float    "difference"
    t.integer  "competitor"
    t.integer  "number_of_communiunities"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "community_growth_forms", force: :cascade do |t|
    t.string   "description"
    t.integer  "count"
    t.float    "percentage_cover_mean"
    t.float    "occurance_mean"
    t.float    "slope"
    t.float    "intercept"
    t.float    "percentage_cover"
    t.float    "proportional_cover"
    t.float    "mean_canopy_diameter"
    t.float    "individuals_per_hectare"
    t.float    "std_deviation"
    t.float    "std_error"
    t.boolean  "has_strong_competitor"
    t.boolean  "has_normal_competitor"
    t.boolean  "has_weak_competitor"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "report_community_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "admin_id"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password"
    t.string   "company_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "companies", ["email"], name: "index_companies_on_email", unique: true, using: :btree
  add_index "companies", ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true, using: :btree

  create_table "crown_diameters", force: :cascade do |t|
    t.integer  "observation_id"
    t.string   "lower_crown_diameter"
    t.string   "upper_crown_diameter"
    t.float    "transect_length"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "code"
  end

  create_table "field_data", force: :cascade do |t|
    t.date     "date"
    t.string   "location"
    t.integer  "latitude_degree"
    t.integer  "latitude_minutes"
    t.integer  "latitude_seconds"
    t.integer  "longitude_degree"
    t.integer  "longitude_minutes"
    t.integer  "longitude_seconds"
    t.string   "habitat_description"
    t.integer  "project_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "scale"
    t.integer  "releve_number"
    t.string   "observer"
    t.integer  "community_id"
  end

  create_table "growth_forms", force: :cascade do |t|
    t.integer  "observation_id"
    t.string   "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "manages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "observations", force: :cascade do |t|
    t.string   "notes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "field_datum_id"
    t.integer  "species_id"
  end

  create_table "plant_covers", force: :cascade do |t|
    t.float    "percentage"
    t.float    "lower_class_limit"
    t.float    "upper_class_limit"
    t.float    "class_interval"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "observation_id"
    t.string   "code"
  end

  create_table "project_reports", force: :cascade do |t|
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "expected_delivery_date"
    t.date     "actual_delivery_date"
    t.boolean  "active"
    t.date     "date_changed"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "report_communities", force: :cascade do |t|
    t.float    "percentage_cover"
    t.float    "mean_canopy_diameter"
    t.float    "individuals_per_hectare"
    t.integer  "community_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "report_communities", ["community_id"], name: "index_report_communities_on_community_id", using: :btree

  create_table "species", force: :cascade do |t|
    t.string   "name"
    t.string   "potential_biomass"
    t.string   "species"
    t.string   "threat_status"
    t.string   "sa_endemic"
    t.string   "sysnonym_of"
    t.string   "common_name"
    t.string   "life_cycle"
    t.string   "growth_forms"
    t.string   "min_hieght"
    t.string   "max_height"
    t.string   "min_altitude"
    t.string   "max_altitude"
    t.string   "distribution"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "species_family_id"
  end

  create_table "species_families", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "company_id"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "welcomes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "report_communities", "communities"
end
