class Horse < ApplicationRecord
  belongs_to :owner
  has_many :activities, through: :horse_activities

  def self.search(search)
    where("name LIKE ? ", "%#{search}%")
  end
end 
