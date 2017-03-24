class Product < ApplicationRecord
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos
end
