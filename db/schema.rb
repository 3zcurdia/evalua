# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 2020_03_07_171015) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'evaluations', force: :cascade do |t|
    t.string 'name', null: false
    t.bigint 'rubric_id', null: false
    t.string 'repo_url'
    t.string 'type'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['rubric_id'], name: 'index_evaluations_on_rubric_id'
  end

  create_table 'points', force: :cascade do |t|
    t.bigint 'score_id', null: false
    t.bigint 'rubric_item_id', null: false
    t.integer 'weight', default: 0
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['rubric_item_id'], name: 'index_points_on_rubric_item_id'
    t.index ['score_id'], name: 'index_points_on_score_id'
  end

  create_table 'rubric_items', force: :cascade do |t|
    t.string 'name', null: false
    t.bigint 'rubric_id', null: false
    t.json 'scores'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['rubric_id'], name: 'index_rubric_items_on_rubric_id'
  end

  create_table 'rubrics', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'scores', force: :cascade do |t|
    t.bigint 'evaluation_id', null: false
    t.bigint 'user_id', null: false
    t.integer 'total_points', default: 0
    t.string 'source_url'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['evaluation_id'], name: 'index_scores_on_evaluation_id'
    t.index ['user_id'], name: 'index_scores_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'provider'
    t.string 'uid'
    t.string 'nickname'
    t.string 'name'
    t.string 'email'
    t.string 'image_url'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'role', default: 0
  end

  add_foreign_key 'evaluations', 'rubrics'
  add_foreign_key 'points', 'rubric_items'
  add_foreign_key 'points', 'scores'
  add_foreign_key 'rubric_items', 'rubrics'
  add_foreign_key 'scores', 'evaluations'
  add_foreign_key 'scores', 'users'
end
