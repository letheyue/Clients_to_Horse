class ProceduresController < ApplicationController
  def procedure_params
    params.require(:procedure).permit(:name)
  end

  def index
    @procedures = Procedure.all.order("created_at DESC").page params[:page]
    @chains = Chain.all
  end

  def new

  end

  def create
      @procedure = Procedure.create!(procedure_params)
      flash[:notice] = "Procedure '#{@procedure.name}' was successfully created."
      redirect_to procedures_path
  end

  def destroy
    @procedure = Procedure.find(params[:id])
    @procedure.destroy
    flash[:notice] = "Procedure '#{@procedure.name}' deleted."
    redirect_to procedures_path
  end

  def show
    @procedure = Procedure.find params[:id]
    @activities = Chain.where(:procedure_id => @procedure.id).page params[:page]
    @chain = Chain.find params[:id]
    @chains = Chain.all

  end
end
