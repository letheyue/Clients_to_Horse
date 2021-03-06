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

ActiveRecord::Schema.define(version: 20170426215518) do

  create_table "activities", force: :cascade do |t|
    t.text     "name"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "comment"
  end

  create_table "chains", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "procedure_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "activity_order"
    t.text     "comment"
    t.index ["activity_id"], name: "index_chains_on_activity_id"
    t.index ["procedure_id"], name: "index_chains_on_procedure_id"
  end

  create_table "docs", force: :cascade do |t|
    t.text     "description"
    t.string   "file_name"
    t.string   "short_name"
    t.integer  "owner_horse_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "owner_id"
  end

  create_table "horse_activities", force: :cascade do |t|
    t.integer  "horse_id"
    t.integer  "activity_id"
    t.integer  "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "date"
    t.float    "price"
    t.text     "comment"
    t.integer  "procedure_id"
    t.integer  "reminder_order"
    t.datetime "reminder_date"
    t.index ["activity_id"], name: "index_horse_activities_on_activity_id"
    t.index ["horse_id"], name: "index_horse_activities_on_horse_id"
    t.index ["procedure_id"], name: "index_horse_activities_on_procedure_id"
  end

  create_table "horses", force: :cascade do |t|
    t.string   "name"
    t.string   "age"
    t.string   "sex"
    t.string   "breed"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_horses_on_owner_id"
  end

  create_table "invoice_pdfs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owner_payments", force: :cascade do |t|
    t.integer  "owner_id"
    t.float    "amount"
    t.text     "comment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.float    "balance"
    t.integer  "billing_type"
    t.text     "horse_name"
    t.text     "procedure_name"
    t.index ["owner_id"], name: "index_owner_payments_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.text     "phone_number"
    t.text     "fax_number"
    t.string   "email"
    t.text     "comments"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "balance"
  end

  create_table "procedures", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.text     "smtp_mail"
    t.text     "smtp_mail_password"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
