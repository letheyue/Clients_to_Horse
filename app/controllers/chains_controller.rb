class ChainsController < ApplicationController
  before_action :logged_in_user

  def chain_params
    params.require(:chain).permit(:activity_order, :procedure_id, :activity_id, :comment)
  end

  def index
    @chains = Chain.includes(:procedure, :activity).all.order("created_at DESC")

  end

  def edit
    @procedure = Procedure.find params[:id]
    @activities = Chain.includes(:activity).where(:procedure_id => @procedure.id).order('activity_order')

  end

  def update
    @procedure = Procedure.find params[:id]
    @chain = Chain.find params[:id]
    @chain.update_attributes!(chain_params)
    flash[:notice] = "#{@procedure.name} was successfully updated."
    redirect_to edit_chain_path(@procedure)
  end

  def new
    @chains = Chain.all.order("created_at DESC")
    @procedures = Procedure.all
    @activities = Activity.all
  end

  def create
    @procedure = Procedure.find params[:procedure_id]
    @chain = Chain.create!(chain_params)
    @chain.update_attribute(:procedure_id, params[:procedure_id].to_i)
    flash[:notice] = "#{@chain.activity.name} was successfully created."
    redirect_to edit_chain_path(@procedure)
  end

  def destroy
    @procedure = Procedure.find params[:procedure_id]
    @chain = Chain.find(params[:id])
    @chain.destroy
    redirect_to edit_chain_path(@procedure)
  end

  def show
    id = params[:id] # retrieve chain ID from URI route
    @chain = Chain.find(id) # look up horse by unique ID
    @procedure = Procedure.find(@chain.procedure_id)
    @activities = Activity.find(@chain.activity_id)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
