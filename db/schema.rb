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

ActiveRecord::Schema.define(version: 20171122165513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitions", force: :cascade do |t|
    t.string   "name"
    t.string   "flag_url"
    t.string   "short_name"
    t.string   "full_name"
    t.integer  "crowdscore_dbid"
    t.integer  "region_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "match_queues", force: :cascade do |t|
    t.integer  "round_id"
    t.integer  "processed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.integer  "home_goals"
    t.integer  "away_goals"
    t.integer  "extra_time"
    t.integer  "season_id"
    t.integer  "venue_id"
    t.integer  "competition_id"
    t.integer  "result"
    t.integer  "round_id"
    t.integer  "match_start"
    t.integer  "crowdscore_dbid"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "region_groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "region_group_id"
    t.integer  "crowdscore_dbid"
    t.string   "flag_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["crowdscore_dbid"], name: "index_region_groups_on_crowdscore_dbid", unique: true, using: :btree
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.integer  "region_group_id"
    t.integer  "crowdscore_dbid"
    t.string   "flag_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["crowdscore_dbid"], name: "index_regions_on_crowdscore_dbid", unique: true, using: :btree
  end

  create_table "rounds", force: :cascade do |t|
    t.string   "name"
    t.integer  "season"
    t.integer  "competition"
    t.integer  "active"
    t.string   "full_name"
    t.integer  "crowdscore_dbid"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["crowdscore_dbid"], name: "index_rounds_on_crowdscore_dbid", unique: true, using: :btree
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "name"
    t.integer  "crowdscore_dbid"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "national"
    t.string   "short_name"
    t.string   "shirt_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "crowdscore_dbid"
    t.string   "short_code"
    t.index ["crowdscore_dbid"], name: "index_teams_on_crowdscore_dbid", unique: true, using: :btree
  end

  create_table "venues", force: :cascade do |t|
    t.integer  "capacity"
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "crowdscore_dbid"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "matches", "competitions"
  add_foreign_key "matches", "seasons"
  add_foreign_key "matches", "teams", column: "away_team_id"
  add_foreign_key "matches", "teams", column: "home_team_id"
end
