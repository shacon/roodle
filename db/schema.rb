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

ActiveRecord::Schema[7.2].define(version: 2025_01_17_200950) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "code_submissions", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "prompt_id"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prompt_id"], name: "index_code_submissions_on_prompt_id"
    t.index ["user_id"], name: "index_code_submissions_on_user_id"
  end

  create_table "prompts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.text "example"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "display_date"
    t.index ["display_date"], name: "index_prompts_on_display_date", unique: true
  end

  create_table "test_cases", force: :cascade do |t|
    t.text "input"
    t.text "expected_output"
    t.bigint "test_suite_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_suite_id"], name: "index_test_cases_on_test_suite_id"
  end

  create_table "test_suites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "prompt_id"
    t.index ["prompt_id"], name: "index_test_suites_on_prompt_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "code_submissions", "prompts"
  add_foreign_key "code_submissions", "users"
end
