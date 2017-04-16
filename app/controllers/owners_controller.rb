class OwnersController < ApplicationController
  
  def owner_params
    params.require(:owner).permit(:name, :email, :phone_number, :fax_number, :address, :comments, :balance)
  end
  
  def show
    id = params[:id] # retrieve owner ID from URI route
    @owner = Owner.find(id) # look up owner by unique ID
    @horses = Horse.where(:owner_id => @owner.id).page params[:page]
    # will render app/views/owners/show.<extension> by default
    sum = 0
    @horses.each do |horse|
        @activities = HorseActivity.includes(:activity).where(:horse_id => horse.id)
        @activities.each do |activity|
            sum = sum + activity.activity.price
        end
    end
    @sum = sum
  end

  def index
    @owners = Owner.all.order("created_at DESC").page params[:page]
    @horses = Horse.all
    if params[:search]
      @owners = Owner.search(params[:search]).order("created_at DESC").page params[:page]
    else
      @owners = Owner.all.order("created_at DESC").page params[:page]
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

  def make_payment
    @owner = Owner.find(params[:owner_id])
    @current_balance = @owner.balance
    @paid = @current_balance.to_i - params[:amount].to_i 
    @owner.update_attribute(:balance, @paid)
    OwnerPayment.create(owner_id: @owner.id, amount: -params[:amount].to_i, balance: @paid, billing_type: 2, comment: params[:comment] )
    redirect_to owner_path(@owner)
  end
  
  def payment_log
    @owner = Owner.find params[:id]
    if params[:type].to_i == 1
      @log = OwnerPayment.where(:owner_id => @owner.id, :billing_type => 1)
    elsif params[:type].to_i == 2
      @log = OwnerPayment.where(:owner_id => @owner.id, :billing_type => 2)
    else
      @log = OwnerPayment.where(:owner_id => @owner.id)
    end
    @log= @log.order("created_at DESC").page params[:page]
  end

  def balance_due
    @owner = Owner.find params[:id]
    @balance_due = BalanceDue.where(:owner_id => @owner.id).order("created_at DESC").page params[:page]
  end
  
  def destroy_log 
    @owner = Owner.find params[:owner_id]
    @log = OwnerPayment.find params[:id]
    @amount = @log.amount
    @otherlogs = OwnerPayment.where("owner_id = ? AND created_at > ?", @owner.id, @log.created_at)
    @otherlogs.each do |log|
      log.update_attribute(:balance, log.balance - @amount)
    end
    @owner.update_attribute(:balance, @owner.balance - @amount)
    @log.destroy
    redirect_to payment_log_path(:id => @owner.id)
  end


end
