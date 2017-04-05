class HorseActivitiesController < ApplicationController  
    def procedure_menu
        @procedures = Procedure.all
        @horse = Horse.find params[:horse_id]
    end
    def activity_menu
        @procedure = Procedure.find params[:procedure_id]
        @horse = Horse.find params[:horse_id]
        @activities = Chain.where(:procedure_id => @procedure.id)
        @activity_names = Activity.all
    end
    def create
        @start_date = Date.civil(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
        @stringex = ""
        @horse_id = params[:horse_id]
        params[:activity].each do |i|
            @pid = params[:activity][i][:procedure_id]
            @aid = params[:activity][i][:activity_id]
            @oid = params[:activity][i][:order]
            @price = params[:activity][i][:price]
            @comment = params[:activity][i][:comment]
            @temp = "procedure #{@pid}, activity #{@aid}, order #{@oid}, price #{@price}"
            @stringex = @stringex + @temp
            HorseActivity.create(horse_id: @horse_id, status: 1, activity_id: @aid, date: @start_date + @oid.to_i.days, price: @price, comment: @comment)
        end

        flash[:notice] = @stringex
        redirect_to horses_path
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
