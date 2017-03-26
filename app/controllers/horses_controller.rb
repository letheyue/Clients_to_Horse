class HorsesController < ApplicationController
  
  def horse_params
    params.require(:horse).permit(:name, :age, :sex, :breed, :owner_id)
  end
  
  def show
    id = params[:id] # retrieve movie ID from URI route
    @horse = Horse.find(id) # look up movie by unique ID
    @owner = Owner.find(@horse.owner_id)
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @owners = Owner.all
    @horses = Horse.all
  end
  
  
  def new
    # default: render 'new' template
  end

  def create
    @horse = Horse.create!(horse_params)
    flash[:notice] = "#{@horse.name} was successfully created."
    redirect_to horses_path

  end

  def edit
    @horse = Horse.find params[:id]
  end

  def update
    @horse = Horse.find params[:id]
    @horse.update_attributes!(horse_params)
    flash[:notice] = "#{@horse.name} was successfully updated."
    redirect_to horse_path(@horse)

  end

  def destroy
    @horse = Horse.find(params[:id])
    @horse.destroy
    flash[:notice] = "Horse '#{@horse.name}' deleted."
    redirect_to horses_path
  end

end
