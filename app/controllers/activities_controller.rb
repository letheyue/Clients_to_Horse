class ActivitiesController < ApplicationController
  def activities_params
    params.require(:activities).permit(:name, :price, :period, :comment)
  end


end
