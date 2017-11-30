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

ActiveRecord::Schema.define(version: 20171206035912) do

  create_table "author_follow_relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "follower_id"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_author_follow_relationships_on_author_id"
  end

  create_table "authors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "birthday"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_authors_on_name", unique: true
  end

  create_table "book_follower_relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "follower_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_follower_relationships_on_book_id"
  end

  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "category_id"
    t.bigint "publisher_id"
    t.bigint "author_id"
    t.text "details"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["category_id"], name: "index_books_on_category_id"
    t.index ["name"], name: "index_books_on_name", unique: true
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "borrows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "borrow_start"
    t.datetime "borrow_end"
    t.boolean "is_accept"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_borrows_on_book_id"
    t.index ["user_id"], name: "index_borrows_on_user_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_comments_on_book_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "book_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_likes_on_book_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "publishers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_publishers_on_name", unique: true
  end

  create_table "ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "book_id"
    t.bigint "user_id"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_ratings_on_book_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "user_follow_relation_ships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_follow_relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_user_follow_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_user_follow_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_user_follow_relationships_on_follower_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.boolean "is_admin"
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "is_activated"
    t.string "activation_digest"
    t.string "avatar_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["is_admin"], name: "index_users_on_is_admin"
    t.index ["name"], name: "index_users_on_name"
  end

  add_foreign_key "author_follow_relationships", "authors"
  add_foreign_key "book_follower_relationships", "books"
  add_foreign_key "books", "authors"
  add_foreign_key "books", "categories"
  add_foreign_key "books", "publishers"
  add_foreign_key "borrows", "books"
  add_foreign_key "borrows", "users"
  add_foreign_key "comments", "books"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "books"
  add_foreign_key "likes", "users"
  add_foreign_key "ratings", "books"
  add_foreign_key "ratings", "users"
end
