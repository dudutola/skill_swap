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

ActiveRecord::Schema[7.1].define(version: 2025_03_07_103544) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "tutor_id", null: false
    t.bigint "pupil_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "issue_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "status", default: "pending"
    t.index ["issue_id"], name: "index_appointments_on_issue_id"
    t.index ["pupil_id"], name: "index_appointments_on_pupil_id"
    t.index ["tutor_id"], name: "index_appointments_on_tutor_id"
  end

  create_table "issues", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.text "available_on"
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "issue_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_id"], name: "index_taggings_on_issue_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "github_avatar_url"
    t.string "github_username"
    t.string "github_name"
    t.string "github_uid"
    t.string "provider"
    t.string "github_location"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "issues"
  add_foreign_key "appointments", "users", column: "pupil_id"
  add_foreign_key "appointments", "users", column: "tutor_id"
  add_foreign_key "issues", "users"
  add_foreign_key "taggings", "issues"
  add_foreign_key "taggings", "tags"
end
