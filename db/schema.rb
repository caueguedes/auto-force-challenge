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

ActiveRecord::Schema.define(version: 2020_08_09_055827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: :cascade do |t|
    t.string "reference"
    t.string "purchase_channel"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reference"], name: "index_batches_on_reference", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.string "reference"
    t.string "purchase_channel"
    t.string "client_name"
    t.text "address"
    t.string "delivery_service"
    t.decimal "total_value"
    t.jsonb "line_items"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "batch_id"
    t.index ["batch_id"], name: "index_orders_on_batch_id"
    t.index ["reference"], name: "index_orders_on_reference", unique: true
  end

  add_foreign_key "orders", "batches"
end
