class ProceduresController < ApplicationController
  def procedure_params
    params.require(:procedures).permit(:name)
  end

  def index
    @procedures = Procedure.all.order("created_at DESC")
    @chains = Chain.all
  end


  def destroy
    @procedure = procedure.find(params[:id])
    @procedure.destroy
    flash[:notice] = "Procedure '#{@procedure.name}' deleted."
    redirect_to procedures_path
  end
end
