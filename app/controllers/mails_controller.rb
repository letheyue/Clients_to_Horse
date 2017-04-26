class MailsController < ApplicationController

  def mail
    @owner = Owner.find(params[:owner_id])
    @content = params[:content]
    @subject = params[:subject]
    @user ||= User.find_by(id: session[:user_id])
    UserMailer.test_mail(@owner, @subject, @content, @user).deliver

    redirect_to owner_path(@owner)
  end


end
