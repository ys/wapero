ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "wapero.be",  
  :user_name            => "info@wapero.be",  
  :password             => ENV["MAIL_PASSWORD"],  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}