class Horse < ApplicationRecord
  belongs_to :owner
  has_many :activities, through: :horse_activities

  paginates_per 10

  def self.search(search)
    search = search.downcase.gsub(/\-/, '')
    where("lower(name) LIKE ?  OR lower(age) LIKE ? OR lower(sex) LIKE ? OR lower(breed) LIKE ?", "%#{search}%" , "%#{search}%", "%#{search}%","%#{search}%")
  end
end 
 