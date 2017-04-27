class Doc < ApplicationRecord
  belongs_to :owner
  mount_uploader :file_name, DocUploader
  
  # A clean and safe way to delete the empty folders that are remained after destroying the uploaded files from the following source
  # http://stackoverflow.com/questions/7994484/empty-folders-when-file-is-deleted-using-carrierwave
  before_destroy :remember_id
  after_destroy :remove_id_directory

  protected
  def remember_id
    @id = id
  end
  def remove_id_directory
    FileUtils.remove_dir("#{Rails.root}/public/uploads/doc/file_name/#{@id}", :force => true)
  end
    
end
