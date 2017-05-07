class HorsesController < ApplicationController
  before_action :logged_in_user

  def horse_params
    params.require(:horse).permit(:name, :age, :sex, :breed, :owner_id)
  end
  
  def show
    id = params[:id] # retrieve horse ID from URI route
    @horse = Horse.includes(:owner).find(id) # look up horse by unique ID
    @owner = @horse.owner
    @horse_activities = HorseActivity.includes(:procedure, :activity).where(:horse_id => id, :status => 1).order("date ASC")
    # will render app/views/horses/show.<extension> by default
  end

  def index
    @horses = Horse.all.order("name ASC")
    @owners = Owner.all
    if params[:search]
      @horses = Horse.search(params[:search]).order("created_at DESC")
    else
      @horses = Horse.all.order("name ASC")
    end
  end
  
  
  def new
    # default: render 'new' template
    if !params[:select_owner].blank?
      @owners = Owner.find params[:select_owner]
    else
      @owners = Owner.first
    end
  end

  def create
    @horse = Horse.create!(horse_params)
    flash[:notice] = "#{@horse.name} was successfully created."
    redirect_to horses_path

  end

  def edit
    @horse = Horse.find params[:id]
    @owners = Owner.all
  end

  def update
    @horse = Horse.find params[:id]
    @horse.update_attributes!(horse_params)
    flash[:notice] = "#{@horse.name} was successfully updated."
    redirect_to horse_path(@horse)

  end

  def destroy
    @horse = Horse.find(params[:id])
    @activities = HorseActivity.where(:horse_id => :id)
    @activities.each do |activity|
      activity.destroy
    end
    @horse.destroy
    flash[:notice] = "Horse #{@horse.name} deleted."
    redirect_to horses_path
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
  def generate_document
    horse = Horse.find(params[:horse_id])
    @horse_of_owner = params[:horse_id].to_i
    @owner = Owner.find(horse.owner_id)
    @doc = Doc.new()
    @doc.owner_id = @owner.id;
    @doc.owner_horse_id = params[:horse_id].to_i
  end

end
