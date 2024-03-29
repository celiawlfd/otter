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

ActiveRecord::Schema[7.0].define(version: 2023_03_16_110252) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "book_recommendations", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.integer "giver_id", null: false
    t.integer "receiver_id", null: false
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read", default: false
    t.index ["book_id"], name: "index_book_recommendations_on_book_id"
    t.index ["giver_id"], name: "index_book_recommendations_on_giver_id"
    t.index ["receiver_id"], name: "index_book_recommendations_on_receiver_id"
  end

  create_table "book_reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.bigint "book_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_reviews_on_book_id"
    t.index ["user_id"], name: "index_book_reviews_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "year"
    t.integer "pages_number"
    t.string "author"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer "following_id", null: false
    t.integer "follower_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id", "following_id"], name: "index_follows_on_follower_id_and_following_id", unique: true
    t.index ["follower_id"], name: "index_follows_on_follower_id"
    t.index ["following_id"], name: "index_follows_on_following_id"
  end

  create_table "list_books", force: :cascade do |t|
    t.string "comment"
    t.bigint "list_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_list_books_on_book_id"
    t.index ["list_id"], name: "index_list_books_on_list_id"
  end

  create_table "list_movies", force: :cascade do |t|
    t.string "comment"
    t.bigint "list_id", null: false
    t.bigint "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_list_movies_on_list_id"
    t.index ["movie_id"], name: "index_list_movies_on_movie_id"
  end

  create_table "list_podcasts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment"
    t.bigint "list_id", null: false
    t.bigint "podcast_id", null: false
    t.index ["list_id"], name: "index_list_podcasts_on_list_id"
    t.index ["podcast_id"], name: "index_list_podcasts_on_podcast_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "movie_recommendations", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.integer "giver_id", null: false
    t.integer "receiver_id", null: false
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read", default: false
    t.index ["giver_id"], name: "index_movie_recommendations_on_giver_id"
    t.index ["movie_id"], name: "index_movie_recommendations_on_movie_id"
    t.index ["receiver_id"], name: "index_movie_recommendations_on_receiver_id"
  end

  create_table "movie_reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.bigint "movie_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_movie_reviews_on_movie_id"
    t.index ["user_id"], name: "index_movie_reviews_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.integer "year"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable"
  end

  create_table "podcast_recommendations", force: :cascade do |t|
    t.bigint "podcast_id", null: false
    t.integer "giver_id", null: false
    t.integer "receiver_id", null: false
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read", default: false
    t.index ["giver_id"], name: "index_podcast_recommendations_on_giver_id"
    t.index ["podcast_id"], name: "index_podcast_recommendations_on_podcast_id"
    t.index ["receiver_id"], name: "index_podcast_recommendations_on_receiver_id"
  end

  create_table "podcast_reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "podcast_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["podcast_id"], name: "index_podcast_reviews_on_podcast_id"
    t.index ["user_id"], name: "index_podcast_reviews_on_user_id"
  end

  create_table "podcasts", force: :cascade do |t|
    t.string "title"
    t.string "publisher"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link"
    t.string "photo_url"
    t.integer "episode_count"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "book_recommendations", "books"
  add_foreign_key "book_reviews", "books"
  add_foreign_key "book_reviews", "users"
  add_foreign_key "list_books", "books"
  add_foreign_key "list_books", "lists"
  add_foreign_key "list_movies", "lists"
  add_foreign_key "list_movies", "movies"
  add_foreign_key "list_podcasts", "lists"
  add_foreign_key "list_podcasts", "podcasts"
  add_foreign_key "lists", "users"
  add_foreign_key "movie_recommendations", "movies"
  add_foreign_key "movie_reviews", "movies"
  add_foreign_key "movie_reviews", "users"
  add_foreign_key "podcast_recommendations", "podcasts"
  add_foreign_key "podcast_reviews", "podcasts"
  add_foreign_key "podcast_reviews", "users"
end
