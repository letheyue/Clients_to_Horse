class Horse < ApplicationRecord
  belongs_to :owner
  has_many :activities, through: :horse_activities
end
