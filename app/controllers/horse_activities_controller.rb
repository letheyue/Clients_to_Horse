class HorseActivitiesController < ApplicationController  
    def procedure_menu
        @procedures = Procedure.all
        @horse = Horse.find params[:horse_id]
    end
    def activity_menu
        @procedure = Procedure.find params[:procedure_id]
        @horse = Horse.find params[:horse_id]
        @activities = Chain.where(:procedure_id => @procedure.id).order("order ASC")
    end
    def new
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
