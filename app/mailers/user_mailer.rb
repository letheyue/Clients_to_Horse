class UserMailer < ActionMailer::Base
  # default :from => "letheyuetemp@gmail.com"

  def registration_confirmation(user)
    mail(:to => user.email, :subject => "Registered", :from => "letheyuetemp@gmail.com")
  end

  def test_mail(owner,mail)
    mail(:to => owner.email, :subject => mail.subject, :from => "letheyuetemp@gmail.com")
  end


end