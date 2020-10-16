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

ActiveRecord::Schema.define(version: 2020_09_16_224258) do

  create_table "features", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "identifier", null: false
    t.string "name", null: false
    t.text "description"
    t.bigint "bucket_type", default: 0, null: false
    t.boolean "active", default: false, null: false
    t.string "winning_variant"
    t.jsonb "variants", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "overrides", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "feature_id"
    t.string "key", null: false
    t.jsonb "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_overrides_on_feature_id"
    t.index ["feature_id"], name: "overrides_auto_index_fk_rails_57a53cb7b8"
  end

  add_foreign_key "overrides", "features"
end
