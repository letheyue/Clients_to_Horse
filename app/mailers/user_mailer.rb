class UserMailer < ActionMailer::Base
  # default :from => "letheyuetemp@gmail.com"

  def registration_confirmation(user)
    mail(:to => user.email, :subject => "Registered", :from => "letheyuetemp@gmail.com")
  end

  def test_mail(owner, subject, content, user)
    @content = content
    delivery_options = { user_name: user.smtp_mail,
                         password: user.smtp_mail_password
                        }
    mail(:to => owner.email, :subject => subject, :from => user.email)
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset", :from => "letheyuetemp@gmail.com"
  end


end