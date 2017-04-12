class HorseActivity < ApplicationRecord
  belongs_to :horse
  belongs_to :activity

  paginates_per 10
end
