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

ActiveRecord::Schema.define(version: 20180510115309) do

  create_table "best_foodstuffs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "foodstuff_id"
    t.integer  "season_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["foodstuff_id"], name: "index_best_foodstuffs_on_foodstuff_id", using: :btree
    t.index ["season_id"], name: "index_best_foodstuffs_on_season_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", using: :btree
  end

  create_table "cooks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "morimori_id"
    t.integer  "foodstuff_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["foodstuff_id"], name: "index_cooks_on_foodstuff_id", using: :btree
    t.index ["morimori_id"], name: "index_cooks_on_morimori_id", using: :btree
  end

  create_table "foodstuff_makes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "foodstuff_id"
    t.integer  "make_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["foodstuff_id"], name: "index_foodstuff_makes_on_foodstuff_id", using: :btree
    t.index ["make_id"], name: "index_foodstuff_makes_on_make_id", using: :btree
  end

  create_table "foodstuffs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",        null: false
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_foodstuffs_on_category_id", using: :btree
  end

  create_table "make_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "picture",    null: false
    t.integer  "make_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["make_id"], name: "index_make_images_on_make_id", using: :btree
  end

  create_table "makes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",     limit: 65535, null: false
    t.integer  "morimori_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["morimori_id"], name: "index_makes_on_morimori_id", using: :btree
  end

  create_table "morimori_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "picture",     null: false
    t.integer  "morimori_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["morimori_id"], name: "index_morimori_images_on_morimori_id", using: :btree
  end

  create_table "morimoris", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_morimoris_on_name", using: :btree
    t.index ["user_id"], name: "index_morimoris_on_user_id", using: :btree
  end

  create_table "seasons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "site_infomations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",      null: false
    t.string   "url",        null: false
    t.string   "url_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "site_id"
    t.index ["site_id"], name: "index_site_infomations_on_site_id", using: :btree
  end

  create_table "sites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                              null: false
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.text     "introduction",           limit: 65535
    t.string   "icon_image"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
