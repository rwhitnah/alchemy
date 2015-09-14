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

ActiveRecord::Schema.define(version: 20150914190136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "concept_taggings", force: :cascade do |t|
    t.float   "relevance"
    t.integer "concept_id"
    t.integer "document_id"
  end

  add_index "concept_taggings", ["concept_id"], name: "index_concept_taggings_on_concept_id", using: :btree
  add_index "concept_taggings", ["document_id"], name: "index_concept_taggings_on_document_id", using: :btree

  create_table "concepts", force: :cascade do |t|
    t.string "text"
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.text   "body"
  end

  create_table "keyword_taggings", force: :cascade do |t|
    t.float   "relevance"
    t.integer "keyword_id"
    t.integer "document_id"
  end

  add_index "keyword_taggings", ["document_id"], name: "index_keyword_taggings_on_document_id", using: :btree
  add_index "keyword_taggings", ["keyword_id"], name: "index_keyword_taggings_on_keyword_id", using: :btree

  create_table "keywords", force: :cascade do |t|
    t.string "text"
  end

  add_foreign_key "concept_taggings", "concepts"
  add_foreign_key "concept_taggings", "documents"
  add_foreign_key "keyword_taggings", "documents"
  add_foreign_key "keyword_taggings", "keywords"
end
