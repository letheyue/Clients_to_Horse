class HorseActivity < ApplicationRecord
  belongs_to :horse
  belongs_to :activity
  belongs_to :procedure
end
