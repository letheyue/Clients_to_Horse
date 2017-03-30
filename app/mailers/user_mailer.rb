class UserMailer < ActionMailer::Base
  # default :from => "letheyuetemp@gmail.com"

  def registration_confirmation(user)
    mail(:to => user.email, :subject => "Registered", :from => "letheyuetemp@gmail.com")
  end

  def test_mail(owner)
    mail(:to => owner.email, :subject => "Test", :from => "letheyuetemp@gmail.com")
  end


end