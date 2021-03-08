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

ActiveRecord::Schema.define(version: 2021_03_08_202021) do

  create_table "cardio", force: :cascade do |t|
    t.string "name"
    t.integer "workout_id"
    t.integer "lifter_id"
    t.float "distance"
    t.float "time"
  end

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.string "location"
  end

  create_table "lifters", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "height"
    t.integer "weight"
    t.string "gender"
  end

  create_table "weights", force: :cascade do |t|
    t.string "name"
    t.integer "workout_id"
    t.integer "lifter_id"
    t.integer "first_reps"
    t.integer "first_weight"
    t.integer "second_reps"
    t.integer "second_weight"
    t.integer "third_reps"
    t.integer "third_weight"
  end

  create_table "workouts", force: :cascade do |t|
    t.integer "lifter_id"
    t.integer "gym_id"
    t.datetime "start"
    t.datetime "end"
    t.boolean "weights"
    t.boolean "cardio"
  end

end
