class HorseActivitiesController < ApplicationController
    before_action :logged_in_user

    def index
        @horse = Horse.find params[:horse_id]
        @done_activities = HorseActivity.includes(:procedure, :activity).where(:horse_id => @horse.id, :status => 2).order("procedure_id ASC, date DESC").page params[:page]

    end
    
    def procedure_menu
        @procedures = Procedure.all.page params[:page]
        @horse = Horse.find params[:horse_id]
    end
    
    def activity_menu
        @procedure = Procedure.find params[:procedure_id]
        @horse = Horse.find params[:horse_id]
        @activities = Chain.includes(:activity).where(:procedure_id => @procedure.id).order('activity_order')
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
            @reminder_order = params[:activity][i][:reminder_order]
            HorseActivity.create(horse_id: @horse_id, status: 1, activity_id: @aid, procedure_id: @pid, date: @start_date + @oid.to_i.days, price: @price.to_i*@quantity.to_i, comment: @comment, reminder_date: @start_date + @oid.to_i.days - @reminder_order.to_i.days)
        end
        redirect_to horse_path(Horse.find(@horse_id))
    end
    
    def edit
        @activity = HorseActivity.includes(:activity).find params[:id]
        @date = params[:select_date]
    end

    def update
        @horseactivity = HorseActivity.includes(:activity, :horse).find params[:id]
        @date = Date.civil(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
        @horseactivity.update_attributes(:date => @date, :price => params[:price], :comment => params[:comment], :reminder_order => params[:reminder_order])
        flash[:notice] = "#{@horseactivity.activity.name} was successfully updated."
        if params[:select_date].blank?
            redirect_to horse_path(@horseactivity.horse)
        else
            redirect_to calendars_show_path(:select_date => params[:select_date].to_date)
        end
    end

    def update_activities
        if !params[:done].blank? then
            params[:done][:id].each do |id|
                @activity = HorseActivity.includes(:horse, :activity, :procedure).find id.to_i
                @horse =  @activity.horse
                @owner = @horse.owner
                @activityname = @activity.activity.name
                @procedurename = @activity.procedure.name
                @activity.update_attribute(:status, 2)
                @balance = @owner.balance
                @new_balance = @balance.to_i + @activity.price.to_i
                @new_payment = OwnerPayment.create(owner_id: @owner.id, amount: @activity.price,balance: @new_balance, billing_type: 1,  comment: "charged for #{@horse.name} : #{@procedurename} , #{@activityname}  completed")
                #@new_payment.update_attribute(:created_at, @activity.date)
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

    def logged_in_user
        unless logged_in?
            flash[:danger] = "Please log in."
            redirect_to login_url
        end
    end
end
