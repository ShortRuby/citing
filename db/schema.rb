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

ActiveRecord::Schema[7.0].define(version: 2023_02_15_025117) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dev_to_articles", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.datetime "published_at", null: false
    t.integer "dev_to_author_id"
    t.json "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_dev_to_articles_on_title"
  end

  create_table "dev_to_authors", force: :cascade do |t|
    t.string "username"
    t.string "original_unique_id"
    t.string "name"
    t.string "summary"
    t.string "website_url"
    t.string "profile_image_url"
    t.string "twitter_username"
    t.string "github_username"
    t.json "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.string "url", null: false
    t.string "entryable_type", null: false
    t.integer "entryable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entryable_type", "entryable_id"], name: "index_entries_on_entryable_type_and_entryable_id"
    t.index ["url"], name: "index_entries_on_url"
  end
end
