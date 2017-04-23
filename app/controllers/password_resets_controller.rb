class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]

  def new
    @user = User.new
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
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Password has been reset."
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:password, :password_confirmation, :smtp_mail, :smtp_mail_password)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end



end

