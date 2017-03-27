class Owner < ApplicationRecord
    has_many :horses, :dependent => :destroy
end
