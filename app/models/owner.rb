class Owner < ApplicationRecord
    has_many :horses
    has_many :docs
    def self.search(search)
        search = search.downcase.gsub(/\-/, '')
        where("lower(name) LIKE ? OR lower(phone_number) LIKE ? OR lower(fax_number) LIKE ? OR lower(address) LIKE ? OR lower(email) LIKE ? OR lower(comments) LIKE ? ", "%#{search}%" , "%#{search}%", "%#{search}%","%#{search}%", "%#{search}%", "%#{search}%")
    end
end
