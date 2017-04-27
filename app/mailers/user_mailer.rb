class UserMailer < ActionMailer::Base
  # default :from => "letheyuetemp@gmail.com"

  def registration_confirmation(user)
    mail(:to => user.email, :subject => "Registered", :from => "letheyuetemp@gmail.com")
  end

  def test_mail(owner, subject, content, user)
    @content = content
    delivery_options = { :user_name => user.smtp_mail,
                         :password => user.smtp_mail_password
                        }
    mail(:to => owner.email, :subject => subject, :from => user.email, delivery_method_options: delivery_options)
  end
  
  def send_invoice(owner, subject, content, user, pdf_file)
    @content = content
    delivery_options = { :user_name => user.smtp_mail,
                         :password => user.smtp_mail_password
                        }
    attachments["Invoice_#{owner.name}_#{Time.now.to_date}.pdf"] =File.read("#{Rails.root}/public/invoice.pdf")
    mail(:to => owner.email, :subject => subject, :from => user.email, delivery_method_options: delivery_options)

  end


end