# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_18_164108) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "amenities", force: :cascade do |t|
    t.string "amenitable_type"
    t.bigint "amenitable_id"
    t.integer "sat_type"
    t.string "sat_details"
    t.string "at_type"
    t.string "at_details"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenitable_type", "amenitable_id"], name: "index_amenities_on_amenitable"
  end

  create_table "attachments", force: :cascade do |t|
    t.string "attachable_type"
    t.bigint "attachable_id"
    t.bigint "user_id"
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.string "name"
    t.boolean "deletable", default: true
    t.integer "category"
    t.string "file_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable"
    t.index ["user_id"], name: "index_attachments_on_user_id"
  end

  create_table "portal_settings", force: :cascade do |t|
    t.bigint "user_id"
    t.string "dzongkhag"
    t.string "gewog"
    t.string "business_name"
    t.integer "theme_colour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_portal_settings_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "salutation"
    t.integer "gender"
    t.string "phone"
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.bigint "owner_id"
    t.integer "property_type"
    t.integer "occupancy_type"
    t.string "property_name"
    t.string "lat"
    t.string "lng"
    t.string "property_description"
    t.string "neighbourhood_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_properties_on_owner_id"
  end

  create_table "roles", force: :cascade do |t|
    t.integer "role_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscription_plans", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_subscription_plans_on_user_id"
  end

  create_table "units", force: :cascade do |t|
    t.bigint "property_id"
    t.integer "monthly_rent"
    t.boolean "occupied"
    t.string "unit_number"
    t.string "nos_of_bed"
    t.string "nos_of_bath"
    t.string "unit_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_units_on_property_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.boolean "enabled"
    t.integer "status"
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attachments", "users"
  add_foreign_key "portal_settings", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "subscription_plans", "users"
  add_foreign_key "users", "roles"
end
