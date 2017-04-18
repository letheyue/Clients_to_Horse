class StaticPagesController < ApplicationController
  before_action :logged_in_user

  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
