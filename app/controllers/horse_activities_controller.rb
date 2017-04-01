class HorseActivitiesController < ApplicationController  
    def new
        @horse = Horse.find(params[:horse_id])
        flash[:notice] = "horse is #{@horse.name}"
    end
    def edit
        @horse_activity = HorseActivity.find params[:id]
        @horse = Horse.find(@horse_activity.horse_id)
        if params[:done]==1
            @horse_activity.update_attribute(:status, 2)
            flash[:notice] = "activities was successfully updated."
        else
            flash[:notice] = "does not change "
        end
        redirect_to horse_path(@horse)
    end
end
