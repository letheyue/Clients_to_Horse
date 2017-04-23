class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]

  def new
    # @user = User.new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      redirect_to edit_password_reset_path(@user)
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif
      @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Password has been reset."
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid password combination'
      render 'edit'
    end
  end

  def edit_smtp_mail
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
    @user = User.find(params[:id])
  end

  def update_smtp_mail
    @user = User.find(params[:id])
    @smtp_mail = params[:smtp_mail]
    @smtp_mail_password = params[:smtp_mail_password]
    @user.update_attribute(:smtp_mail , @smtp_mail)
    @user.update_attribute(:smtp_mail_password , @smtp_mail_password)
    flash[:success] = "Smtp mail has been reset."
    redirect_to @user
  end


  private
  def user_params
    params.require(:user).permit(:password, :password_confirmation, :smtp_mail, :smtp_mail_password)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end



end

