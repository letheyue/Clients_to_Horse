class CalendarsController < ApplicationController
  before_action :logged_in_user

  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @allactivities = HorseActivity.all
    if !params[:select_date].blank? then
      @activities = HorseActivity.includes(:horse, :procedure, :activity).where("date >= ? AND date < ?", params[:select_date].to_date, params[:select_date].to_date+1.days).order("status ASC").page params[:page]
      @reminder_activities = (HorseActivity.includes(:horse, :procedure, :activity).where("reminder_date >= ? AND reminder_date < ?", params[:select_date].to_date, params[:select_date].to_date+1.days) -
          HorseActivity.includes(:horse, :procedure, :activity).where("date >= ? AND date < ?", params[:select_date].to_date, params[:select_date].to_date+1.days).order("status ASC"))
    end
  end

  def everyday_activities
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @horses = Horse.all
    @procedures = Procedure.all
    @activity_names = Activity.all
    @allactivities = HorseActivity.all
    if !params[:select_date].blank? then
      @activities = HorseActivity.where("date >= ? AND date < ?", params[:select_date].to_date, params[:select_date].to_date+1.days).page params[:page]
      @reminder_activities = (HorseActivity.includes(:horse, :procedure, :activity).where("reminder_date >= ? AND reminder_date < ?", params[:select_date].to_date, params[:select_date].to_date+1.days).order("status ASC") -
          HorseActivity.includes(:horse, :procedure, :activity).where("date >= ? AND date < ?", params[:select_date].to_date, params[:select_date].to_date+1.days).order("status ASC"))
    end
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

end
