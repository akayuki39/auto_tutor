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

ActiveRecord::Schema.define(version: 20170412024034) do

  create_table "courses", force: :cascade do |t|
    t.integer  "course_number"
    t.text     "course_name"
    t.date     "start_time"
    t.date     "finish_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "teacher_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.text     "semester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.text     "task_name"
    t.date     "start_time"
    t.date     "finish_time"
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "no"
    t.string   "email"
    t.string   "type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.index ["no"], name: "index_users_on_no", unique: true
  end

end
