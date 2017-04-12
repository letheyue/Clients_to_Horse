class Chain < ApplicationRecord
  belongs_to :activity
  belongs_to :procedure

  paginates_per 10
end
