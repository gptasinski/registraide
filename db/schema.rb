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

ActiveRecord::Schema.define(version: 20160327135332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name",                            null: false
    t.string   "number",                          null: false
    t.string   "title"
    t.text     "description"
    t.string   "prereq"
    t.integer  "department_id"
    t.boolean  "diploma_program", default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "student_id",                null: false
    t.integer  "section_id",                null: false
    t.string   "semester"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "periods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requirements", force: :cascade do |t|
    t.string   "course_id"
    t.string   "grade_level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name",                        null: false
    t.string   "code",                        null: false
    t.string   "description"
    t.integer  "seats"
    t.integer  "course_id"
    t.integer  "period_id"
    t.boolean  "closed",      default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "student_requirements", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "requirement_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                       null: false
    t.string   "last_name",                        null: false
    t.string   "email",                            null: false
    t.integer  "id_number"
    t.string   "current_homeroom"
    t.string   "password_digest"
    t.boolean  "admin",            default: false
    t.integer  "grade_level",                      null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

end
