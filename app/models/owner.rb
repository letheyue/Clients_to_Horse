class Owner < ApplicationRecord
    has_many :horses

    def self.search(search)
        search = search.gsub(/\-/, '')
        where("name LIKE ? OR phone_number LIKE ? OR fax_number LIKE ? OR address LIKE ? OR email LIKE ? OR comments LIKE ? ", "%#{search}%" , "%#{search}%", "%#{search}%","%#{search}%", "%#{search}%", "%#{search}%")
    end
end
