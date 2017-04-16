class MailsController < ApplicationController

  def mail_params
    params.require(:mail).permit(:owner_id, :subject, :comment)
  end

  def send_mail
    @owner = Owner.find params[:owner_id]
  end

  def mail
    @owner = Owner.find(params[:owner_id])
    SendMail.create(owner_id: @owner.id, subject: params[:subject], comment: params[:comment] )
    @mail = SendMail.last
    UserMailer.test_mail(@owner,@mail).deliver
    redirect_to owner_path(@owner)
  end


end
