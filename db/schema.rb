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

ActiveRecord::Schema.define(version: 20150425020329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "company_users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "company_users", ["email"], name: "index_company_users_on_email", unique: true, using: :btree
  add_index "company_users", ["reset_password_token"], name: "index_company_users_on_reset_password_token", unique: true, using: :btree

  create_table "invitations", force: :cascade do |t|
    t.string   "email"
    t.integer  "user_id"
    t.datetime "invitation_date"
    t.string   "purpose"
    t.string   "qr_code_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "active"
    t.string   "code"
    t.string   "poc"
  end

  add_index "invitations", ["user_id"], name: "index_invitations_on_user_id", using: :btree

  create_table "tenants", force: :cascade do |t|
    t.string   "name"
    t.string   "domain"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "password"
  end

  create_table "visitors", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "time"
    t.string   "purpose"
    t.string   "poc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "invitations", "users"
end
