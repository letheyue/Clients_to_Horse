class HorseActivitiesController < ApplicationController  
    def index
        @horse = Horse.find params[:horse_id]
        @done_activities = HorseActivity.where(:horse_id => @horse.id, :status => 2).order("procedure_id ASC, date DESC")
        @procedures = Procedure.all
        @activities = Activity.all
    end
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
            @pid = params[:procedure_id]
            @aid = params[:activity][i][:activity_id]
            @oid = params[:activity][i][:order]
            @price = params[:activity][i][:price]
            @quantity = params[:activity][i][:quantity]
            @comment = params[:activity][i][:comment]
            @temp = "procedure #{@pid}, activity #{@aid}, order #{@oid}, price #{@price}"
            @stringex = @stringex + @temp
            HorseActivity.create(horse_id: @horse_id, status: 1, activity_id: @aid, procedure_id: @pid, date: @start_date + @oid.to_i.days, price: @price.to_i*@quantity.to_i, comment: @comment)
        end

        flash[:notice] = @stringex
        redirect_to horse_path(Horse.find(@horse_id))
    end

  def update_activities
    @horse =  Horse.find params[:horse_id]
    if !params[:done].blank? then
      params[:done][:id].each do |id|
        @activity = HorseActivity.find id.to_i
        @activity.update_attribute(:status, 2)
      end
    end
    if !params[:delete].blank? then
        params[:delete][:id].each do |id|
            @activity = HorseActivity.find id.to_i
            @activity.destroy
        end
    end
    flash[:notice] = "activities were successfully updated."
    redirect_to horse_path(@horse)
   end
    def destroy_from_horse
        @horse = Horse.find params[:horse_id]
        @activity = HorseActivity.find params[:activity_id]
        @other_activities = HorseActivity.where(:procedure_id => @activity.procedure_id, :status => 1)
        @activity.destroy
        @other_activities.each do |other_activity|
            other_activity.destroy
        end    
        flash[:notice] = "activities were successfully deleted."
        redirect_to horse_path(@horse)
        
    end
end
