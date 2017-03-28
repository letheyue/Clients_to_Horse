class HorseActivitiesController < ApplicationController  
    def edit
        @horse_activity = HorseActivity.find params[:id]
        @horse = Horse.find(@horse_activity.horse_id)
        if params[:done].blank?
            @horse_activity.update_attribute(:status, 2)
            flash[:notice] = "activities was successfully updated."
        end
        redirect_to horse_path(@horse)
    end
end
