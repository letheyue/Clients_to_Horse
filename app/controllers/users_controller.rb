class UsersController < ApplicationController
  before_action :logged_in_user

  def new
  end

  def show
    @user = User.find(params[:id])
    session[:user_id] = @user.id
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      log_in @user
      flash[:success] = "Welcome to the Clients to Horse App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:stmp_mail, :stmp_mail_password,
                                 :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

end
