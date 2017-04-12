class Horse < ApplicationRecord
  belongs_to :owner
  has_many :activities, through: :horse_activities

  paginates_per 10

  def self.search(search)
    search = search.gsub(/\-/, '')
    where("name LIKE ?  OR age LIKE ? OR sex LIKE ? OR breed LIKE ?", "%#{search}%" , "%#{search}%", "%#{search}%","%#{search}%")
  end
end 
 