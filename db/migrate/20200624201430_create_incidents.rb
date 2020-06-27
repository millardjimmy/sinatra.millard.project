class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.text :victim_name
      t.integer :victim_age
      t.text :victim_gender
      t.text :victim_race
      t.text :victim_image_url
      t.date :incident_date
      t.text :incident_street_address
      t.text :incident_city
      t.text :incident_state
      t.text :incident_zip
      t.text :incident_county
      t.text :agency_responsible
      t.text :cause_of_death
      t.text :alleged_victim_crime
      t.text :crime_category
      t.text :solution
      t.text :incident_description
      t.text :official_disposition_of_death
      t.text :criminal_charges
      t.text :news_url
      t.text :mental_illness
      t.text :unarmed
      t.text :line_of_duty #this could be a boolean
      t.text :note
      t.text :in_custody
      t.belongs_to :user
    end
  end
end