class DownloadsController < ApplicationController
  before_action :logged_in_user

  def show
    respond_to do |format|
      format.pdf { send_invoice_pdf }
    end
  end
    
  def mail_pdf
    @owner = Owner.find(params[:id])
    @content = params[:content]
    @subject = params[:subject]
    @user ||= User.find_by(id: session[:user_id])
    invoice = OwnerPayment.where(:owner_id => params[:id], :created_at => params[:select_time].to_date.beginning_of_month..(params[:select_time].to_date+1.month).beginning_of_month)
    invoice_pdf = InvoicePdf.new(invoice, @owner)
    UserMailer.send_invoice(@owner, @subject, @content, @user,invoice_pdf.to_pdf).deliver
    redirect_to payment_log_path(:id => @owner.id)
  end
 
  private
 
  def invoice_pdf
    owner = Owner.find params[:id]
    invoice = OwnerPayment.where(:owner_id => params[:id], :created_at => params[:select_time].to_date.beginning_of_month..(params[:select_time].to_date+1.month).beginning_of_month)
    InvoicePdf.new(invoice, owner)
  end

 
  def send_invoice_pdf
    send_file invoice_pdf.to_pdf,
      filename: invoice_pdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
end
