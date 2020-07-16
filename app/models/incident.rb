class Incident < ActiveRecord::Base
    belongs_to :user
    validates :crime_category, presence: true



end 