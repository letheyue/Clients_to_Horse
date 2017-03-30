ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "letheyuetemp.com",
    :user_name            => "letheyuetemp",
    :password             => "zpbwruoaxjavcoes",
    :authentication       => "plain",
    :enable_starttls_auto => true
}