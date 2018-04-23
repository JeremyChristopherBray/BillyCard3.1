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

ActiveRecord::Schema.define(version: 20180423222228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"
  enable_extension "pgcrypto"

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "user_id"
    t.uuid "transactions_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transactions_id"], name: "index_accounts_on_transactions_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "credit_cards", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nickName"
    t.string "provider"
    t.string "pointsProvidor"
    t.decimal "interestRate"
    t.decimal "balance"
    t.decimal "limit"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dueDate"
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "expense_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.uuid "expense_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_expense_categories_on_expense_id"
  end

  create_table "expenses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.integer "frequency"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "incomes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "amount"
    t.integer "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.integer "incomeType", default: 0
    t.integer "country", default: 0
    t.string "name"
    t.string "payer"
    t.boolean "taxable", default: true
    t.boolean "super", default: true
    t.index ["user_id"], name: "index_incomes_on_user_id"
  end

  create_table "loans", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "lengthInMonths"
    t.decimal "repayment"
    t.integer "amount"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_loans_on_user_id"
  end

  create_table "subs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "amount"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "archive", default: false, null: false
    t.integer "frequency", default: 0
    t.index ["user_id"], name: "index_subs_on_user_id"
  end

  create_table "transactions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "date"
    t.decimal "amount"
    t.uuid "credit_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "transactionDate"
    t.decimal "transactionAmount"
    t.string "transactionDescription"
    t.uuid "account_id"
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["credit_card_id"], name: "index_transactions_on_credit_card_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstName"
    t.string "lastName"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "transactions", "accounts"
end
