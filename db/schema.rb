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

ActiveRecord::Schema.define(version: 20200624201500) do

  create_table "incidents", force: :cascade do |t|
    t.text    "victim_name"
    t.integer "victim_age"
    t.text    "victim_gender"
    t.text    "victim_race"
    t.text    "victim_image_url"
    t.date    "incident_date"
    t.text    "incident_street_address"
    t.text    "incident_city"
    t.text    "incident_state"
    t.text    "incident_zip"
    t.text    "incident_county"
    t.text    "agency_responsible"
    t.text    "cause_of_death"
    t.text    "alleged_victim_crime"
    t.text    "crime_category"
    t.text    "solution"
    t.text    "incident_description"
    t.text    "official_disposition_of_death"
    t.text    "criminal_charges"
    t.text    "news_url"
    t.text    "mental_illness"
    t.text    "unarmed"
    t.text    "line_of_duty"
    t.text    "note"
    t.text    "in_custody"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
