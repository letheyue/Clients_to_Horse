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
    @procedure = Procedure.find(params[:id])
    @activities = HorseActivity.where("procedure_id = ?", @procedure.id)
    @activities.each do |activity|
      activity.destroy
    end
    @procedure.destroy
    flash[:notice] = "Procedure '#{@procedure.name}' deleted."
    redirect_to procedures_path
  end

  def show
    @procedure = Procedure.find params[:id]
    @activities = Chain.includes(:activity).where(:procedure_id => @procedure.id).order("activity_order ASC")
  end
end
