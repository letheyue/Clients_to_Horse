class InvoicePdf
  include RenderAnywhere
 
  def initialize(invoice, owner)
    @invoice = invoice
    @owner = owner
  end
 
  def to_pdf
    kit = PDFKit.new(as_html, page_size: 'A4')
    kit.to_file("#{Rails.root}/public/invoice.pdf")
  end
 
  def filename
    "Invoice_#{@owner.name}_#{Time.now.to_date}.pdf"
  end
 
  private
    attr_reader :owner_payment
 
    def as_html
      render template: "owners/invoice_pdf", layout: "invoice_pdf", locals: { log: @invoice, owner: @owner}
    end
end
