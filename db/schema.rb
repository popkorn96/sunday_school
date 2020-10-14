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

ActiveRecord::Schema.define(version: 2020_10_14_175827) do

  create_table "assignments", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "due_date"
    t.boolean "complete", default: false
    t.integer "teacher_id"
    t.integer "child_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "children", force: :cascade do |t|
    t.integer "age"
    t.string "favorite_color"
    t.integer "classroom_id"
    t.integer "parent_id"
    t.integer "assignment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
  end

  create_table "children_assignments", id: false, force: :cascade do |t|
    t.integer "child_id"
    t.integer "assignment_id"
    t.index ["assignment_id"], name: "index_children_assignments_on_assignment_id"
    t.index ["child_id"], name: "index_children_assignments_on_child_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "teacher_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parents", force: :cascade do |t|
    t.integer "phone_number"
    t.string "email"
    t.string "emergency_name"
    t.integer "emergency_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "phone_number"
    t.string "email"
    t.integer "dl"
    t.boolean "volunteer", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
  end

end
