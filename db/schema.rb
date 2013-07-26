# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20130726205010) do

  create_table "invitations", force: true do |t|
    t.string  "token"
    t.integer "project_id"
    t.integer "email"
  end

  create_table "project_members", force: true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  add_index "project_members", ["project_id"], name: "index_project_members_on_project_id"
  add_index "project_members", ["user_id"], name: "index_project_members_on_user_id"

  create_table "projects", force: true do |t|
    t.string   "title"
    t.text     "objective"
    t.integer  "user_id"
    t.datetime "due_date"
    t.boolean  "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "tasks", force: true do |t|
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.datetime "due_date"
    t.string   "instructions"
    t.boolean  "complete",     default: false
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar"
    t.integer  "invitation_id"
    t.string   "team_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
