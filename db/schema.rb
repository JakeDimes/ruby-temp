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

ActiveRecord::Schema.define(version: 2021_12_04_011703) do

  create_table "accounts", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.integer "dotnum"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "team_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.string "team"
    t.string "name"
    t.integer "evalID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gets_assigneds", force: :cascade do |t|
    t.integer "team_id"
    t.integer "eval_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "responses", force: :cascade do |t|
    t.string "teamname"
    t.integer "userID"
    t.integer "ratedUserID"
    t.integer "rating"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.integer "team_id"
    t.date "due_date"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
