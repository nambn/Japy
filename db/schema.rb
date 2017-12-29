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

ActiveRecord::Schema.define(version: 20171227175900) do

  create_table "books", primary_key: "book_id", force: :cascade do |t|
    t.text "title", null: false
    t.text "level", null: false
    t.integer "price", null: false
    t.text "cover_image", null: false
    t.text "description", null: false
  end

  create_table "grammars", primary_key: "grammar_id", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "unit", null: false
    t.text "head", null: false
    t.text "body", null: false
  end

  create_table "learned_vocabs", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "vocab_id", null: false
    t.index ["user_id", "vocab_id"], name: "index_learned_vocabs_on_user_id_and_vocab_id"
  end

  create_table "owned_books", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.index ["user_id", "book_id"], name: "index_owned_books_on_user_id_and_book_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "vocabs", primary_key: "vocab_id", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "unit", null: false
    t.text "japanese", null: false
    t.text "kanji"
    t.text "vietnamese", null: false
    t.text "example"
  end

end
