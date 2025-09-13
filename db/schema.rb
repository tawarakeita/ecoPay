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

ActiveRecord::Schema[7.1].define(version: 2025_09_13_054741) do
  create_table "merchants", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.text "description"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_merchants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_merchants_on_reset_password_token", unique: true
  end

  create_table "missions", force: :cascade do |t|
    t.integer "merchant_id", null: false
    t.string "title"
    t.text "description"
    t.integer "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "complete_code"
    t.index ["complete_code"], name: "index_missions_on_complete_code", unique: true
    t.index ["merchant_id"], name: "index_missions_on_merchant_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "merchant_id", null: false
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_payments_on_merchant_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "point_transactions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "merchant_id", null: false
    t.string "transaction_type"
    t.integer "amount"
    t.integer "mission_id", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_point_transactions_on_merchant_id"
    t.index ["mission_id"], name: "index_point_transactions_on_mission_id"
    t.index ["user_id"], name: "index_point_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "missions", "merchants"
  add_foreign_key "payments", "merchants"
  add_foreign_key "payments", "users"
  add_foreign_key "point_transactions", "merchants"
  add_foreign_key "point_transactions", "missions"
  add_foreign_key "point_transactions", "users"
end
