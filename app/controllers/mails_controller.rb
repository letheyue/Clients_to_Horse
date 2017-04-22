class MailsController < ApplicationController
  before_action :logged_in_user

  def mail_params
    params.require(:mail).permit(:owner_id, :subject, :comment)
  end

  def send_mail
    @owner = Owner.find params[:owner_id]
  end

  def mail
    @owner = Owner.find(params[:owner_id])
    @content = params[:content]
    @subject = params[:subject]
    UserMailer.test_mail(@owner, @subject, @content).deliver

    redirect_to owner_path(@owner)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

end
