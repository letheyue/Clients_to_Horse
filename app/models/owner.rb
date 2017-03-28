class Owner < ApplicationRecord
    has_many :horses

    def self.search(search)
        where("name LIKE ? OR address LIKE ? OR email LIKE ? OR comments LIKE ? ", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    end
end
