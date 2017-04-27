class Doc < ApplicationRecord
  belongs_to :owner

  mount_uploader :file_name, DocUploader

    
end
