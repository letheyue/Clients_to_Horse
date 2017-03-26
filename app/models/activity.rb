class Activity < ApplicationRecord
    has_many :horses, through: :horse_activities
end
