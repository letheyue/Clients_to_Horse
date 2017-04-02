class ChainsController < ApplicationController
  def chain_params
    params.require(:chain).permit(:order, :procedure_id, :activity_id)
  end

  def edit

  end

  def new
    @procedures = Procedure.all
    @activities = Activity.all
  end

  def create
    @chain = Chain.create!(chain_params)
    flash[:notice] = "#{@procedure.name} was successfully created."
    redirect_to chains_path
  end

  def show
    id = params[:id] # retrieve chain ID from URI route
    @chain = Chain.find(id) # look up horse by unique ID
    @procedure = Procedure.find(@chain.procedure_id)
    @activities = Activity.find(@chain.activity_id)
  end
end
