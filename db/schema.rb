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

ActiveRecord::Schema.define(version: 20180705142448) do

  create_table "milestone_cases", force: :cascade do |t|
    t.integer  "project_module_id",   null: false
    t.integer  "module_test_case_id", null: false
    t.integer  "milestone_id",        null: false
    t.string   "status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "milestone_cases", ["milestone_id"], name: "index_milestone_cases_on_milestone_id"
  add_index "milestone_cases", ["module_test_case_id"], name: "index_milestone_cases_on_module_test_case_id"
  add_index "milestone_cases", ["project_module_id"], name: "index_milestone_cases_on_project_module_id"

  create_table "milestones", force: :cascade do |t|
    t.string   "name"
    t.integer  "project_id", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "status"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "milestones", ["project_id"], name: "index_milestones_on_project_id"

  create_table "module_test_cases", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "project_module_id", null: false
    t.datetime "deleted_at"
    t.boolean  "deleted"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "module_test_cases", ["project_module_id"], name: "index_module_test_cases_on_project_module_id"

  create_table "project_modules", force: :cascade do |t|
    t.string   "module_name"
    t.integer  "project_id",  null: false
    t.datetime "deleted_at"
    t.boolean  "deleted"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "project_modules", ["project_id"], name: "index_project_modules_on_project_id"

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.datetime "deleted_at"
    t.boolean  "deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
