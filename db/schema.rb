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

  create_table "competitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "flag_url"
    t.string   "short_name"
    t.string   "full_name"
    t.integer  "crowdscore_dbid"
    t.integer  "region_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "match_queues", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "round_id"
    t.integer  "processed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "away_team_id"
    t.integer  "home_team_id"
    t.integer  "away_goals"
    t.integer  "home_goals"
    t.integer  "extra_time"
    t.integer  "season_id"
    t.integer  "venue_id"
    t.integer  "competition_id"
    t.integer  "result"
    t.string   "match_start",     limit: 50
    t.integer  "round_id"
    t.integer  "crowdscore_dbid"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["away_team_id"], name: "fk_rails_6a75121a9b", using: :btree
    t.index ["competition_id"], name: "fk_rails_f711d64481", using: :btree
    t.index ["home_team_id"], name: "fk_rails_4aed6bdf0d", using: :btree
    t.index ["season_id"], name: "fk_rails_5b83ef0b54", using: :btree
  end

  create_table "region_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "region_group_id"
    t.integer  "crowdscore_dbid"
    t.string   "flag_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["crowdscore_dbid"], name: "index_region_groups_on_crowdscore_dbid", unique: true, using: :btree
  end

  create_table "regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "region_group_id"
    t.integer  "crowdscore_dbid"
    t.string   "flag_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["crowdscore_dbid"], name: "index_regions_on_crowdscore_dbid", unique: true, using: :btree
  end

  create_table "rounds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "season_id"
    t.integer  "competition_id"
    t.integer  "active"
    t.string   "full_name"
    t.integer  "crowdscore_dbid"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["crowdscore_dbid"], name: "index_rounds_on_crowdscore_dbid", unique: true, using: :btree
  end

  create_table "seasons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "crowdscore_dbid"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "national",        limit: 1
    t.string   "short_name"
    t.string   "short_code"
    t.string   "shirt_url"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "crowdscore_dbid"
    t.index ["crowdscore_dbid"], name: "index_teams_on_crowdscore_dbid", unique: true, using: :btree
  end

  create_table "venues", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "capacity"
    t.string   "name"
    t.float    "latitude",        limit: 24
    t.float    "longitude",       limit: 24
    t.integer  "crowdscore_dbid"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_foreign_key "matches", "competitions"
  add_foreign_key "matches", "seasons"
  add_foreign_key "matches", "teams", column: "away_team_id"
  add_foreign_key "matches", "teams", column: "home_team_id"
end
