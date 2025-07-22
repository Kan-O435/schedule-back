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


ActiveRecord::Schema[7.1].define(version: 2025_06_27_061058) do
=======
ActiveRecord::Schema[7.1].define(version: 2025_05_13_101249) do
>>>>>>> acfad9cfc518fc21e273e8aaf9469b0b7d6cc2f0
  create_table "plans", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_plans_on_user_id"
  end


  create_table "share_plans", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_share_plans_on_plan_id"
    t.index ["user_id", "plan_id"], name: "index_share_plans_on_user_id_and_plan_id", unique: true
    t.index ["user_id"], name: "index_share_plans_on_user_id"
  end

  create_table "shares", force: :cascade do |t|
    t.string "title"
=======
  create_table "shares", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "mail", null: false
    t.string "password_digest", null: false
>>>>>>> acfad9cfc518fc21e273e8aaf9469b0b7d6cc2f0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "uid", null: false
    t.string "name"
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

  add_foreign_key "plans", "users"
  add_foreign_key "share_plans", "plans"
  add_foreign_key "share_plans", "users"
end
