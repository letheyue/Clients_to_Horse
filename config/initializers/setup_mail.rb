ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :authentication       => "plain",
    :enable_starttls_auto => true
}