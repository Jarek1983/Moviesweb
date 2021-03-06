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

ActiveRecord::Schema.define(version: 2019_01_01_154815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.datetime "birthday"
    t.text "description"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.bigint "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["user_id"], name: "index_actors_on_user_id"
  end

  create_table "actors_movies", id: false, force: :cascade do |t|
    t.bigint "actor_id", null: false
    t.bigint "movie_id", null: false
    t.index ["actor_id", "movie_id"], name: "index_actors_movies_on_actor_id_and_movie_id"
    t.index ["movie_id", "actor_id"], name: "index_actors_movies_on_movie_id_and_actor_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.integer "rating"
    t.bigint "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_comments_on_movie_id"
  end

  create_table "directors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "directors_movies", id: false, force: :cascade do |t|
    t.bigint "director_id", null: false
    t.bigint "movie_id", null: false
    t.index ["director_id", "movie_id"], name: "index_directors_movies_on_director_id_and_movie_id"
    t.index ["movie_id", "director_id"], name: "index_directors_movies_on_movie_id_and_director_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "genres_movies", id: false, force: :cascade do |t|
    t.bigint "genre_id", null: false
    t.bigint "movie_id", null: false
    t.index ["genre_id", "movie_id"], name: "index_genres_movies_on_genre_id_and_movie_id"
    t.index ["movie_id", "genre_id"], name: "index_genres_movies_on_movie_id_and_genre_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.datetime "premiere_date"
    t.string "length"
    t.text "description"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "movie_file_name"
    t.string "movie_content_type"
    t.bigint "movie_file_size"
    t.datetime "movie_updated_at"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_movies_on_user_id"
  end

  create_table "movies_screenwriters", id: false, force: :cascade do |t|
    t.bigint "screenwriter_id", null: false
    t.bigint "movie_id", null: false
    t.index ["movie_id", "screenwriter_id"], name: "index_movies_screenwriters_on_movie_id_and_screenwriter_id"
    t.index ["screenwriter_id", "movie_id"], name: "index_movies_screenwriters_on_screenwriter_id_and_movie_id"
  end

  create_table "screenwriters", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "userid"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

  add_foreign_key "actors", "users"
  add_foreign_key "comments", "movies"
  add_foreign_key "movies", "users"
end
