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

ActiveRecord::Schema[8.0].define(version: 2025_11_23_050623) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "action_mailbox_inbound_emails", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.string "message_id", null: false
    t.string "message_checksum", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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

  create_table "erp_core_accounts", force: :cascade do |t|
    t.string "name", null: false
    t.string "subdomain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subdomain"], name: "index_erp_core_accounts_on_subdomain", unique: true
  end

  create_table "erp_core_admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_erp_core_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_erp_core_admins_on_reset_password_token", unique: true
  end

  create_table "erp_core_permissions", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_erp_core_permissions_on_name", unique: true
  end

  create_table "erp_core_role_permissions", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "permission_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_erp_core_role_permissions_on_permission_id"
    t.index ["role_id", "permission_id"], name: "index_erp_core_role_permissions_on_role_and_permission", unique: true
    t.index ["role_id"], name: "index_erp_core_role_permissions_on_role_id"
  end

  create_table "erp_core_roles", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "account_id"], name: "index_erp_core_roles_on_name_and_account", unique: true
  end

  create_table "erp_core_user_accounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "account_id", null: false
    t.boolean "owner", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_erp_core_user_accounts_on_account_id"
    t.index ["user_id", "account_id"], name: "index_erp_core_user_accounts_on_user_and_account", unique: true
    t.index ["user_id"], name: "index_erp_core_user_accounts_on_user_id"
  end

  create_table "erp_core_user_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_erp_core_user_roles_on_role_id"
    t.index ["user_id", "role_id", "account_id"], name: "index_erp_core_user_roles_on_user_role_account", unique: true
    t.index ["user_id"], name: "index_erp_core_user_roles_on_user_id"
  end

  create_table "erp_core_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_erp_core_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_erp_core_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_erp_core_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "erp_core_role_permissions", "erp_core_permissions", column: "permission_id"
  add_foreign_key "erp_core_role_permissions", "erp_core_roles", column: "role_id"
  add_foreign_key "erp_core_user_accounts", "erp_core_accounts", column: "account_id"
  add_foreign_key "erp_core_user_accounts", "erp_core_users", column: "user_id"
  add_foreign_key "erp_core_user_roles", "erp_core_roles", column: "role_id"
  add_foreign_key "erp_core_user_roles", "erp_core_users", column: "user_id"
end
