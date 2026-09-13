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

ActiveRecord::Schema[8.1].define(version: 2026_09_13_112441) do
  create_table "dumpers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "fatigue"
    t.string "fl"
    t.string "fr"
    t.string "location"
    t.string "make"
    t.string "model"
    t.string "rli"
    t.string "rlo"
    t.string "rri"
    t.string "rro"
    t.string "slno"
    t.datetime "updated_at", null: false
  end
end
