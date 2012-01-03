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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120103101728) do

  create_table "designers", :force => true do |t|
    t.string   "email",                                 :default => "",       :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",       :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "prestige",                              :default => "Rookie"
    t.float    "earning",                               :default => 0.0
    t.float    "rating",                                :default => 0.0
  end

  add_index "designers", ["email"], :name => "index_designers_on_email", :unique => true
  add_index "designers", ["reset_password_token"], :name => "index_designers_on_reset_password_token", :unique => true

  create_table "employers", :force => true do |t|
    t.string   "email",                                 :default => "",            :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",            :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "prestige",                              :default => "Just Joined"
    t.float    "credit",                                :default => 1000.0
  end

  add_index "employers", ["email"], :name => "index_employers_on_email", :unique => true
  add_index "employers", ["reset_password_token"], :name => "index_employers_on_reset_password_token", :unique => true

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.float    "budget"
    t.datetime "deadline"
    t.string   "type"
    t.string   "file_type"
    t.string   "logo_type"
    t.text     "color"
    t.string   "used_for"
    t.string   "status",      :default => "open"
    t.integer  "employer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["employer_id"], :name => "index_projects_on_employer_id"

  create_table "submissions", :force => true do |t|
    t.integer  "rating"
    t.integer  "designer_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "screenshot_file_name"
    t.string   "screenshot_content_type"
    t.integer  "screenshot_file_size"
    t.datetime "screenshot_updated_at"
  end

  add_index "submissions", ["designer_id"], :name => "index_submissions_on_designer_id"
  add_index "submissions", ["project_id"], :name => "index_submissions_on_project_id"

end
