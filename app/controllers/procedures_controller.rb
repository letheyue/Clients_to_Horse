class ProceduresController < ApplicationController
  def procedure_params
    params.require(:procedure).permit(:name)
  end

  def index
    @procedures = Procedure.all.order("created_at DESC")
    @chains = Chain.all
  end

  def new

  end

  def create
      @procedure = Procedure.create!(procedure_params)
      # flash[:notice] = "#{Procedure.find(@chain.procedure_id).name} was successfully created."
      redirect_to procedures_path
  end

  def destroy
    @procedure = procedure.find(params[:id])
    @procedure.destroy
    flash[:notice] = "Procedure '#{@procedure.name}' deleted."
    redirect_to procedures_path
  end

  def show
    id = params[:id] # retrieve chain ID from URI route
    @procedure = Procedure.find(id) # look up horse by unique ID
    @chain = Chain.find(id)

  end
end
