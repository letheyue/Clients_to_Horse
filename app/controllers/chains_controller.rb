class ChainsController < ApplicationController
  def chain_params
    params.require(:chain).permit(:activity_order, :procedure_id, :activity_id, :comment)
  end

  def index
    @chains = Chain.all.order("created_at DESC")
    @procedures = Procedure.all
    @activities = Activity.all
  end

  def edit
    @procedure = Procedure.find params[:id]
    @activities = Chain.where(:procedure_id => @procedure.id)
    @activity_names = Activity.all
    @chain = Chain.find params[:id]
    @chains = Chain.all
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
    @chain = Chain.find params[:chain_id]
    @chain = Chain.create!(chain_params)
    @chain.update_attribute(:procedure_id, params[:procedure_id].to_i)
    flash[:notice] = "#{Activity.find(@chain.activity_id).name} was successfully created."
    redirect_to edit_chain_path(@procedure)
  end


  def show
    id = params[:id] # retrieve chain ID from URI route
    @chain = Chain.find(id) # look up horse by unique ID
    @procedure = Procedure.find(@chain.procedure_id)
    @activities = Activity.find(@chain.activity_id)
  end
end
