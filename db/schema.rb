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

ActiveRecord::Schema.define(:version => 20121117173714) do

  create_table "article_categories", :force => true do |t|
    t.integer  "article_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "article_tags", :force => true do |t|
    t.integer  "article_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "body"
    t.string   "photo"
    t.integer  "autor_id"
    t.string   "source"
    t.string   "type"
    t.string   "state"
    t.boolean  "hot"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "biographies", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "body"
    t.string   "photo"
    t.integer  "autor_id"
    t.string   "source"
    t.string   "type"
    t.string   "state"
    t.boolean  "hot"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "biography_categories", :force => true do |t|
    t.integer  "biography_id"
    t.integer  "category_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "biography_tags", :force => true do |t|
    t.integer  "biography_id"
    t.integer  "tag_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "galleries", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "body"
    t.string   "photo"
    t.integer  "autor_id"
    t.string   "source"
    t.string   "type"
    t.string   "state"
    t.boolean  "hot"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "gallery_categories", :force => true do |t|
    t.integer  "gallery_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "gallery_images", :force => true do |t|
    t.string   "image"
    t.string   "title"
    t.string   "description"
    t.integer  "gallery_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "gallery_tags", :force => true do |t|
    t.integer  "gallery_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "interview_categories", :force => true do |t|
    t.integer  "interview_id"
    t.integer  "category_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "interview_tags", :force => true do |t|
    t.integer  "interview_id"
    t.integer  "tag_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "interviews", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "body"
    t.string   "photo"
    t.integer  "autor_id"
    t.string   "source"
    t.string   "type"
    t.string   "state"
    t.boolean  "hot"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "body"
    t.string   "photo"
    t.integer  "autor_id"
    t.string   "source"
    t.string   "type"
    t.string   "state"
    t.boolean  "hot"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "news_categories", :force => true do |t|
    t.integer  "news_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "news_tags", :force => true do |t|
    t.integer  "news_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "post_categories", :force => true do |t|
    t.integer  "post_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "post_tags", :force => true do |t|
    t.integer  "post_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "body"
    t.string   "photo"
    t.integer  "autor_id"
    t.string   "source"
    t.string   "type"
    t.string   "state"
    t.boolean  "hot"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_hobbies", :force => true do |t|
    t.integer  "profile_id"
    t.string   "title"
    t.string   "description"
    t.integer  "position"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_people", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "biography_id"
    t.integer  "position"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "user_photos", :force => true do |t|
    t.integer  "profile_id"
    t.string   "image"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_profiles", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "birthdate"
    t.integer  "country_id"
    t.integer  "city_id"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "nickname"
    t.string   "provider"
    t.string   "url"
    t.string   "email"
    t.string   "remember_me"
    t.string   "password"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "video_categories", :force => true do |t|
    t.integer  "video_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "video_tags", :force => true do |t|
    t.integer  "video_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "body"
    t.string   "photo"
    t.integer  "autor_id"
    t.string   "source"
    t.string   "type"
    t.string   "state"
    t.boolean  "hot"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
