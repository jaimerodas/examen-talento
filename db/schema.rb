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

ActiveRecord::Schema.define(version: 20170910194254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name"
    t.string "last_name"
    t.bigint "service_id", null: false
    t.bigint "opening_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_candidates_on_email", unique: true
    t.index ["opening_id"], name: "index_candidates_on_opening_id"
    t.index ["service_id"], name: "index_candidates_on_service_id", unique: true
  end

  create_table "exam_answers", force: :cascade do |t|
    t.bigint "section_result_id", null: false
    t.text "title", null: false
    t.string "type", null: false
    t.jsonb "answers"
    t.text "answer"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_result_id"], name: "index_exam_answers_on_section_result_id"
  end

  create_table "exam_questions", force: :cascade do |t|
    t.bigint "exam_section_id"
    t.integer "position"
    t.text "title", null: false
    t.string "type", null: false
    t.jsonb "answers"
    t.boolean "random_order", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_section_id"], name: "index_exam_questions_on_exam_section_id"
  end

  create_table "exam_results", force: :cascade do |t|
    t.bigint "exam_id", null: false
    t.bigint "candidate_id", null: false
    t.integer "final_grade"
    t.boolean "passed"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.index ["candidate_id"], name: "index_exam_results_on_candidate_id"
    t.index ["exam_id"], name: "index_exam_results_on_exam_id"
    t.index ["passed"], name: "index_exam_results_on_passed"
  end

  create_table "exam_sections", force: :cascade do |t|
    t.text "title", null: false
    t.string "type", null: false
    t.integer "max_points"
    t.integer "time_to_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exam_sections_exams", id: false, force: :cascade do |t|
    t.bigint "exam_id", null: false
    t.bigint "exam_section_id", null: false
    t.integer "position"
  end

  create_table "exams", force: :cascade do |t|
    t.text "title", null: false
    t.integer "passing_grade", null: false
    t.boolean "locked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "openings", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "service_id", null: false
    t.bigint "test_stage_id", null: false
    t.bigint "passed_stage_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "exam_id"
    t.boolean "locked", default: false, null: false
    t.index ["exam_id"], name: "index_openings_on_exam_id"
    t.index ["service_id"], name: "index_openings_on_service_id", unique: true
  end

  create_table "section_results", force: :cascade do |t|
    t.bigint "exam_result_id", null: false
    t.bigint "exam_section_id"
    t.text "title"
    t.integer "points"
    t.integer "max_points"
    t.integer "time_to_answer"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.index ["exam_result_id"], name: "index_section_results_on_exam_result_id"
    t.index ["exam_section_id"], name: "index_section_results_on_exam_section_id"
  end

  add_foreign_key "candidates", "openings"
  add_foreign_key "exam_answers", "section_results"
  add_foreign_key "exam_questions", "exam_sections"
  add_foreign_key "exam_results", "candidates"
  add_foreign_key "exam_results", "exams"
  add_foreign_key "openings", "exams"
  add_foreign_key "section_results", "exam_results"
  add_foreign_key "section_results", "exam_sections"
end
