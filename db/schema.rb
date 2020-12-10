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

ActiveRecord::Schema.define(version: 2020_03_24_033401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluations", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "rubric_id", null: false
    t.string "repo_url"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "aasm_state"
    t.datetime "closed_on"
    t.index ["rubric_id"], name: "index_evaluations_on_rubric_id"
  end

  create_table "item_categories", force: :cascade do |t|
    t.string "name"
    t.integer "weight"
    t.text "summary"
    t.bigint "rubric_item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rubric_item_id"], name: "index_item_categories_on_rubric_item_id"
  end

  create_table "points", force: :cascade do |t|
    t.bigint "rubric_item_id", null: false
    t.integer "weight", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_evaluation_id"
    t.index ["rubric_item_id"], name: "index_points_on_rubric_item_id"
    t.index ["user_evaluation_id"], name: "index_points_on_user_evaluation_id"
  end

  create_table "rubric_items", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "rubric_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "min_score", default: 0
    t.integer "max_score", default: 3
    t.index ["rubric_id"], name: "index_rubric_items_on_rubric_id"
  end

  create_table "rubrics", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_evaluations", force: :cascade do |t|
    t.bigint "evaluation_id", null: false
    t.bigint "user_id", null: false
    t.integer "total_points", default: 0
    t.string "source_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["evaluation_id"], name: "index_user_evaluations_on_evaluation_id"
    t.index ["user_id"], name: "index_user_evaluations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "nickname"
    t.string "name"
    t.string "email"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 0
  end

  add_foreign_key "evaluations", "rubrics"
  add_foreign_key "item_categories", "rubric_items"
  add_foreign_key "points", "rubric_items"
  add_foreign_key "rubric_items", "rubrics"
  add_foreign_key "user_evaluations", "evaluations"
  add_foreign_key "user_evaluations", "users"
end
