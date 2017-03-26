class OwnersController < ApplicationController
  
  def owner_params
    params.require(:owner).permit(:name, :email, :phone_number, :fax_number, :address, :comments)
  end
  
  def show
    id = params[:id] # retrieve movie ID from URI route
    @owner = Owner.find(id) # look up movie by unique ID
    @horses = Horse.where(:owner_id => @owner.id)
    # will render app/views/movies/show.<extension> by default
    sum = 0
    @horses.each do |horse|
        @activities = HorseActivity.where(:horse_id => horse.id)
        @activities.each do |activity|
            sum = sum + Activity.find(activity.activity_id).price
        end
    end
    @sum = sum
  end

  def index
    @owners = Owner.all
    @horses = Horse.all
  end
  
  
  def new
    # default: render 'new' template
  end

  def create
    @owner = Owner.create!(owner_params)
    flash[:notice] = "#{@owner.name} was successfully created."
    redirect_to owners_path

  end

  def edit
    @owner = Owner.find params[:id]
  end

  def update
    @owner = Owner.find params[:id]
    @owner.update_attributes!(owner_params)
    flash[:notice] = "#{@owner.name} was successfully updated."
    redirect_to owner_path(@owner)

  end

  def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy
    flash[:notice] = "Customer '#{@owner.name}' deleted."
    redirect_to owners_path
  end

end
