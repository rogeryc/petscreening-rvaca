# frozen_string_literal: true

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

ActiveRecord::Schema[7.1].define(version: 20_240_525_175_706) do
  create_table 'breed_infos', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.integer 'min_life'
    t.integer 'max_life'
    t.boolean 'hypoallergenic'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'owners', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'phone'
    t.string 'address'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'pets', force: :cascade do |t|
    t.string 'name'
    t.string 'kind'
    t.string 'breed'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.decimal 'weight'
    t.integer 'owner_id'
    t.integer 'breed_info_id'
    t.index ['breed_info_id'], name: 'index_pets_on_breed_info_id'
    t.index ['owner_id'], name: 'index_pets_on_owner_id'
  end

  add_foreign_key 'pets', 'breed_infos'
  add_foreign_key 'pets', 'owners'
end
