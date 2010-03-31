ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address => "mail.yahoo.com",
    :port => 25,
    :domain => "www.yahoo.com",
    :authentication => :login,
    :user_name => "gainpad@yahoo.com",
    :password => "secret"}