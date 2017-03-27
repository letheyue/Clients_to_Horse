class Horse < ApplicationRecord
  belongs_to :owner
  has_many :activities, through: :horse_activities

  def self.search(search)
    where("name LIKE ?  OR age LIKE ? OR sex LIKE ? OR breed LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%","%#{search}%")
  end
end 
