class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #log in the profile
      if params[:session][:remember_me] == '1'
        remember(user)
      else
        forget(user)
      end

      log_in user
      remember user
      redirect_to user
    else
      # wrong information
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
