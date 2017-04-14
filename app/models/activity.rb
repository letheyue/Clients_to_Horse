class Activity < ApplicationRecord
    has_many :horses, through: :horse_activities
    has_many :procedures, through: :chains
end
