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


end