class ChainsController < ApplicationController
  def chain_params
    params.require(:chain).permit(:activity_order, :procedure_id, :activity_id)
  end

  def index
    @chains = Chain.all.order("created_at DESC")
    @procedures = Procedure.all
    @activities = Activity.all
  end

  def edit
    @procedure = Procedure.find params[:id]
    @chain = Chain.find params[:id]
    @chains = Chain.all
  end

  def update
    @procedure = Procedure.find params[:id]
    @chain = Chain.find params[:id]
    @chain.update_attributes!(chain_params)
    flash[:notice] = "#{@procedure.name} was successfully updated."
    redirect_to procedure_path(@procedure)
  end

  def new
    @chains = Chain.all.order("created_at DESC")
    @procedures = Procedure.all
    @activities = Activity.all
  end

  def create
    @chain = Chain.create!(chain_params)
    # flash[:notice] = "#{Procedure.find(@chain.procedure_id).name} was successfully created."
    redirect_to procedures_path
  end

  def show
    id = params[:id] # retrieve chain ID from URI route
    @chain = Chain.find(id) # look up horse by unique ID
    @procedure = Procedure.find(@chain.procedure_id)
    @activities = Activity.find(@chain.activity_id)
  end
end
