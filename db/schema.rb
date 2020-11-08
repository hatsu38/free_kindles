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

ActiveRecord::Schema.define(version: 2020_11_08_082033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_series", comment: "本のシリーズ", force: :cascade do |t|
    t.string "title", null: false, comment: "本のシリーズタイトル"
    t.integer "books_count", default: 1, null: false, comment: "本の巻数"
    t.text "description", default: "", null: false, comment: "本の説明"
    t.string "amazon_url", default: "", null: false, comment: "参考のAmazonURL"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "books", comment: "本", force: :cascade do |t|
    t.string "title", null: false, comment: "本のタイトル"
    t.integer "book_number", default: 1, null: false, comment: "何巻目の本か"
    t.text "description", default: "", null: false, comment: "本の説明"
    t.integer "price", default: 0, null: false, comment: "本の値段"
    t.string "amazon_url", default: "", null: false, comment: "参考のAmazonURL"
    t.string "amazon_image_url", default: "", null: false, comment: "参考のAmazonの画像URL"
    t.bigint "book_series_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_series_id"], name: "index_books_on_book_series_id"
  end

  add_foreign_key "books", "book_series"
end
