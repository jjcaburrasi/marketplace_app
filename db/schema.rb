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

ActiveRecord::Schema.define(version: 2022_10_03_192327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_admins_on_unlock_token", unique: true
  end

  create_table "candidacies", force: :cascade do |t|
    t.bigint "worker_id", null: false
    t.bigint "job_request_id", null: false
    t.string "status", default: "Application submitted"
    t.date "start_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_request_id"], name: "index_candidacies_on_job_request_id"
    t.index ["worker_id"], name: "index_candidacies_on_worker_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "address", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_clients_on_confirmation_token", unique: true
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_clients_on_unlock_token", unique: true
  end

  create_table "job_requests", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "job_function"
    t.string "address"
    t.integer "vacancies_count"
    t.float "monthly_salary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "skills", default: [], null: false, array: true
    t.integer "filled_vacancies", default: 0, null: false
    t.text "skills_necessary", default: [], null: false, array: true
    t.index ["client_id"], name: "index_job_requests_on_client_id"
  end

  create_table "placements", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "worker_id", null: false
    t.bigint "candidacy_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.float "monthly_salary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "job_request_id"
    t.index ["candidacy_id"], name: "index_placements_on_candidacy_id"
    t.index ["client_id"], name: "index_placements_on_client_id"
    t.index ["job_request_id"], name: "index_placements_on_job_request_id"
    t.index ["worker_id"], name: "index_placements_on_worker_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "worker_id", null: false
    t.bigint "placement_id", null: false
    t.integer "worker_rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_ratings_on_client_id"
    t.index ["placement_id"], name: "index_ratings_on_placement_id"
    t.index ["worker_id"], name: "index_ratings_on_worker_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "working", default: false
    t.boolean "rehirable"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "skills", default: [], null: false, array: true
    t.boolean "available", default: true
    t.index ["confirmation_token"], name: "index_workers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_workers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_workers_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_workers_on_unlock_token", unique: true
  end

  add_foreign_key "candidacies", "job_requests"
  add_foreign_key "candidacies", "workers"
  add_foreign_key "job_requests", "clients"
  add_foreign_key "placements", "candidacies"
  add_foreign_key "placements", "clients"
  add_foreign_key "placements", "job_requests"
  add_foreign_key "placements", "workers"
  add_foreign_key "ratings", "clients"
  add_foreign_key "ratings", "placements"
  add_foreign_key "ratings", "workers"
end
