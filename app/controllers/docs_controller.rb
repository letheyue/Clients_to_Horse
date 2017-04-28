class DocsController < ApplicationController
  def new
    @doc = Doc.new
  end
  def create
    doc = Doc.new(doc_params)
    owner = Owner.find doc_params[:owner_id]
    
    if doc_params[:file_name].to_s.empty?
      flash[:notice] = "Invalid name for the document"
    else
        doc.short_name = "#{doc_params[:file_name].original_filename}"
        doc.owner_horse_id = doc_params[:owner_horse_id].to_i
        if owner.docs.where(short_name: doc.short_name).present?
            flash[:notice] = "A document with the same name is attached to this owner!"
        elsif
            doc.save
            owner.save
            flash[:notice] = "#{doc.file_name} was successfully uploaded and added to #{owner.name}. The owner has #{owner.docs.length} files now."
        end
    end
    redirect_to owner_path(owner)
  end
  
  def download_file
    doc = Doc.find(params[:doc_id])
    address = doc.file_name.file.path
    puts("ADDRESS: ")
    puts(doc.file_name.file.path)
    
    send_file(doc.file_name.file.path,
        :filename =>doc.short_name,
        :type => doc.file_name.content_type,
        :disposition => 'attachment',
       :url_based_filename => true)
  end
  
  def show
    @doc = Doc.find(params[:doc_id])
  end
  
  def destroy
    doc = Doc.find(params[:doc_id])
    owner = Owner.find doc.owner_id
    # remove and destroy the file
    doc.remove_file_name
    doc.destroy;
    #clean up the database
    Doc.delete doc
    owner.docs.delete doc
    owner.save 
    redirect_to owner_path(owner)
  end
  
  def redirect_to_owner
    doc = Doc.find(params[:doc_id])
    owner = Owner.find doc.owner_id
    redirect_to owner_path(owner)
  end
  
  
  private 
  def doc_params
  params.require(:doc).permit(:file_name, :owner_id, :description, :owner_horse_id)
  end
  

    
end