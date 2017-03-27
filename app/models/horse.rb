class Horse < ApplicationRecord
  belongs_to :owner, :dependent => :delete
  has_many :activities, through: :horse_activities
end
