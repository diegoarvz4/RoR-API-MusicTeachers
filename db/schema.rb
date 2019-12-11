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

ActiveRecord::Schema.define(version: 2019_12_11_044203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "music_teacher_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["music_teacher_id"], name: "index_appointments_on_music_teacher_id"
  end

  create_table "music_genres", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
  end

  create_table "music_genres_teachers", id: false, force: :cascade do |t|
    t.bigint "music_teacher_id", null: false
    t.bigint "music_genre_id", null: false
    t.index ["music_genre_id", "music_teacher_id"], name: "genres_and_teachers_group_index"
    t.index ["music_teacher_id", "music_genre_id"], name: "teachers_and_genres_group_index"
  end

  create_table "music_teachers", force: :cascade do |t|
    t.string "name"
    t.integer "years_experiencie"
    t.float "ranking"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "music_teachers_musical_instruments", id: false, force: :cascade do |t|
    t.bigint "music_teacher_id", null: false
    t.bigint "musical_instrument_id", null: false
    t.index ["music_teacher_id", "musical_instrument_id"], name: "teachers_and_insts_group_index"
    t.index ["musical_instrument_id", "music_teacher_id"], name: "insts_and_teachers_group_index"
  end

  create_table "musical_instruments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kind"
  end

  add_foreign_key "appointments", "music_teachers"
end
