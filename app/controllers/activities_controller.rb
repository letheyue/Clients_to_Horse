class ActivitiesController < ApplicationController
  def activity_params
    params.require(:activity).permit(:name, :price, :period, :comment)
  end

  def index
    @activities = Activity.all.order("created_at DESC").page params[:page]
  end

  def new

  end

  def create
    @activity = Activity.create!(activity_params)
    flash[:notice] = "#{@activity.name} was successfully created."
    redirect_to activities_path
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activities = HorseActivity.where("activity_id = ?", @activity.id)
    @activities.each do |activity|
      activity.destroy
    end
    @chains = Chain.where("activity_id = ?", @activity.id)
    @chains.each do |chain|
      chain.destroy
    end
    @activity.destroy
    flash[:notice] = "Activity '#{@activity.name}' deleted."
    redirect_to activities_path
  end

  def edit
    @activity = Activity.find params[:id]
  end

  def update
    @activity = Activity.find params[:id]
    @activity.update_attributes!(activity_params)
    flash[:notice] = "#{@activity.name} was successfully updated."
    redirect_to activities_path(@activity)

  end

end
