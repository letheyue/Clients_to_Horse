class ChainsController < ApplicationController
  before_action :logged_in_user

  def chain_params
    params.require(:chain).permit(:activity_order, :procedure_id, :activity_id, :comment)
  end

  def edit
    @procedure = Procedure.find params[:id]
    @activities = Chain.includes(:activity).where(:procedure_id => @procedure.id).order('activity_order')

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


  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
