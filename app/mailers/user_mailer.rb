class UserMailer < ActionMailer::Base
  # default :from => "letheyuetemp@gmail.com"

  def registration_confirmation(user)
    mail(:to => user.email, :subject => "Registered", :from => "letheyuetemp@gmail.com")
  end

  def test_mail(owner, subject, content)
    @content = content
    mail(:to => owner.email, :subject => subject, :from => "jency267@gmail.com")
  end


end