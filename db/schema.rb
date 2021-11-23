# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_23_114733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.text "address"
    t.date "start_date"
    t.date "end_date"
    t.boolean "active", default: true
    t.bigint "individual_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["individual_id"], name: "index_addresses_on_individual_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.string "address"
    t.text "detail"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.date "fully_signed_at"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_contracts_on_company_id"
  end

  create_table "individuals", force: :cascade do |t|
    t.string "title"
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "phone_number"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_individuals_on_user_id"
  end

  create_table "signatories", force: :cascade do |t|
    t.boolean "signing_status", default: false
    t.bigint "contract_id", null: false
    t.bigint "individual_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contract_id"], name: "index_signatories_on_contract_id"
    t.index ["individual_id"], name: "index_signatories_on_individual_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "role"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "individuals"
  add_foreign_key "companies", "users"
  add_foreign_key "contracts", "companies"
  add_foreign_key "individuals", "users"
  add_foreign_key "signatories", "contracts"
  add_foreign_key "signatories", "individuals"
end
