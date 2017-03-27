class Owner < ApplicationRecord
    has_many :horses

    def self.search(search)
        where("name LIKE ? ", "%#{search}%")
    end
end
