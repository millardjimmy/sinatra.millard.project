class Incident < ActiveRecord::Base
    belongs_to :user

    def self.permitted_params
        [ 
          :victim_name, :victim_age, :victim_gender, :victim_race, 
          :victim_image_url, :incident_date,
          :incident_street_address, :incident_city, :within_city_limits, 
          :incident_state, :incident_zip, :incident_county,
          :agency_responsible, :officers_involved, 
          :race_of_officers_involved, :gender_of_officers_involved,
          :notes_related_to_officers_involved, :cause_of_death, 
          :alleged_victim_crime, :crime_category, :aggregate_crime_category,
          :suspect_weapon_type, :solution, :incident_description, 
          :official_disposition_of_death, :criminal_charges,
          :news_url, :mental_illness, :unarmed, :line_of_duty, :note, 
          :in_custody, :arrest_related_death
         ]
      end

      def self.state_options
        [
            'AK', 'AL', 'AR', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 
            'MS', 'FL', 'GA', 'HI', 'IA', 'ID', 'IL', 'IN', 
            'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MI', 'MN', 'MO', 
            'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 
            'NY', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 
            'TX', 'UT', 'VA', 'VT', 'WA', 'WI', 'WV', 'WY'
        ]
      end

      def self.crime_category_options
        [
         'Violent Crime (Non Lethal); Armed with Gun',
         'Violent Crime (Non Lethal); No Gun',
         'Violent Crime (Potentially Lethal); Armed with Gun',
         'Violent Crime (Potentially Lethal); No Gun',
         'No Crime',
         'Property Crime; Armed with Gun',
         'Property Crime; No Gun',
         'Traffic Violation; Armed with Gun',
         'Traffic Violation; No Gun',
         'Murder; Armed with Gun',
         'Murder; No Gun',
         'Other',
         'Unknown/Unspecified',
         'Drugs',
         'Broken Windows Offense',
         'Weapons Possession Offense'
        ]
      end

      def self.gender_options
        ['Male', 'Female', 'Other']
      end
    
      def self.race_options
        ['Black', 'White', 'Hispanic', 'Asian', 
        'Pacific Islander', 'Native American', 'Unknown Race']
      end
    
      def self.cause_of_death_options
        ['Asphyxiation', 'Beaten', 'Gunshot', 'Taser', 'Beanbag',
         'Vehicle', 'Death in Custody', 'Medical Emergency',
         'Physical restraint', 'Pepper Spray', 'Other']
      end
    
      def self.official_disposition_of_death_options
        ['Unreported',
         'Unknown',
         'Justified',
         'Charged',
         'Pending Investigation',
         'Other']
      end

      def self.mental_illness_options
        ['Yes', 'No', 'Unknown']
      end
    
      def self.unarmed_options
        ['Unarmed',
         'Allegedly Armed',
         'Unclear',
         'Vehicle']
      end
    
      def self.line_of_duty_options
        ['Line of Duty',
         'Not line of duty/Accidental']
      end
    
      def self.in_custody_options
        ['In-custody',
         'Inmate',
         'No']
      end
    
      def self.criminal_charges_options
        ['No Known Charges',
         'Charged with Crime']
      end

end 