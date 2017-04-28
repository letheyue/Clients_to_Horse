class DownloadsController < ApplicationController
  def show
    respond_to do |format|
      format.pdf { send_invoice_pdf }
    end
  end
 
  private
 
  def invoice_pdf
    owner = Owner.find params[:id]
    invoice = OwnerPayment.where(:owner_id => params[:id], :billing_type => 1, :created_at => params[:select_time].to_date.beginning_of_month..(params[:select_time].to_date+1.month).beginning_of_month)
    InvoicePdf.new(invoice, owner)
  end
 
  def send_invoice_pdf
    send_file invoice_pdf.to_pdf,
      filename: invoice_pdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end
end
