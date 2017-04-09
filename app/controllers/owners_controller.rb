class OwnersController < ApplicationController
  
  def owner_params
    params.require(:owner).permit(:name, :email, :phone_number, :fax_number, :address, :comments, :balance)
  end
  
  def show
    id = params[:id] # retrieve owner ID from URI route
    @owner = Owner.find(id) # look up owner by unique ID
    @horses = Horse.where(:owner_id => @owner.id)
    # will render app/views/owners/show.<extension> by default
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
    @owners = Owner.all.order("created_at DESC")
    @horses = Horse.all
    if params[:search]
      @owners = Owner.search(params[:search]).order("created_at DESC")
    else
      @owners = Owner.all.order("created_at DESC")
    end
  end
  
  
  def new
    # default: render 'new' template
  end

  def create
    @owner = Owner.create!(owner_params)
    @owner.update_attribute(:balance, 0)
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
    @horses = Horse.where(:owner_id => @owner.id)
    @horses.each do |horse|
        horse.destroy
    end
    redirect_to owners_path
  end

  def search
    @owners = Owner.all
    if params[:search]
      @owners = Owner.search(params[:search]).order("created_at DESC")
    else
      @owners = Owner.all.order("created_at DESC")
    end
  end

  def mail
    @owner = Owner.find(params[:owner_id])
    UserMailer.test_mail(@owner).deliver
    redirect_to owner_path(@owner)
  end
  
  def make_payment
    @owner = Owner.find(params[:owner_id])
    @current_balance = @owner.balance
    @paid = @current_balance.to_i - params[:amount].to_i 
    @owner.update_attribute(:balance, @paid)
    OwnerPayment.create(owner_id: @owner.id, amount: params[:amount].to_i, comment: params[:comment] )
    redirect_to owner_path(@owner)
  end
  
  def payment_log
    @owner = Owner.find params[:id]
    @log = OwnerPayment.where(:owner_id => @owner.id)
  end
end
