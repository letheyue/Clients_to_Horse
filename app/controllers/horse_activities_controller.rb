class HorseActivitiesController < ApplicationController  

    def index
        @horse = Horse.find params[:horse_id]
        @done_activities = HorseActivity.where(:horse_id => @horse.id, :status => 2).order("procedure_id ASC, date DESC").page params[:page]
        @procedures = Procedure.all
        @activities = Activity.all
    end
    
    def procedure_menu
        @procedures = Procedure.all.page params[:page]
        @horse = Horse.find params[:horse_id]
    end
    
    def activity_menu
        @procedure = Procedure.find params[:procedure_id]
        @horse = Horse.find params[:horse_id]
        @activities = Chain.where(:procedure_id => @procedure.id).order('activity_order')
        @activity_names = Activity.all
    end
    
    def create
        @start_date = Date.civil(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
        @horse_id = params[:horse_id]
        params[:activity].each do |i|
            @pid = params[:procedure_id]
            @aid = params[:activity][i][:activity_id]
            @oid = params[:activity][i][:order]
            @price = params[:activity][i][:price]
            @quantity = params[:activity][i][:quantity]
            @comment = params[:activity][i][:comment]
            HorseActivity.create(horse_id: @horse_id, status: 1, activity_id: @aid, procedure_id: @pid, date: @start_date + @oid.to_i.days, price: @price.to_i*@quantity.to_i, comment: @comment)
        end
        redirect_to horse_path(Horse.find(@horse_id))
    end

    def update_activities
        if !params[:done].blank? then
            params[:done][:id].each do |id|
                @activity = HorseActivity.find id.to_i
                @horse =  Horse.find (@activity.horse_id)
                @owner = Owner.find @horse.owner_id
                @activityname = Activity.find(@activity.activity_id).name
                @procedurename = Procedure.find(@activity.procedure_id).name
                @activity.update_attribute(:status, 2)
                @balance = @owner.balance
                @new_balance = @balance.to_i + @activity.price.to_i
                OwnerPayment.create(owner_id: @owner.id, amount: @activity.price,balance: @new_balance, billing_type: 1,  comment: "charged for #{@horse.name} : #{@procedurename} , #{@activityname}  completed")
                @owner.update_attribute(:balance, @new_balance)
            end
        end
        flash[:notice] = "activities were successfully updated."
        if params[:date].blank?
            @horse = Horse.find params[:horse_id]
            redirect_to horse_path(@horse)
        else
            redirect_to calendars_show_path(:select_date => params[:date].to_date)
        end
    end
    
    def destroy_from_horse
        @horse = Horse.find params[:horse_id]
        @activity = HorseActivity.find params[:activity_id]
        @other_activities = HorseActivity.where("procedure_id = ? AND created_at >= ? AND created_at <?  AND date > ? ", "#{@activity.procedure_id}", "#{@activity.created_at}","#{@activity.created_at + 1.seconds}", "#{@activity.date}")
        @activity.destroy
        @other_activities.each do |other_activity|
            other_activity.destroy
        end    
        flash[:notice] = "activities were successfully deleted."
        if params[:date].blank?
            redirect_to horse_path(@horse)
        else
            redirect_to calendars_show_path(:select_date => params[:date].to_date)
        end
    end
end
