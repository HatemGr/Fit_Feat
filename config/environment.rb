# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => ENV['MAILJET_API_KEY'],
    :password => ENV['MAILJET_SECRET_KEY'],
    :domain => 'fit-feat.com',
    :address => 'in-v3.mailjet.com', 
    tls: true ,
    :port => '465',
    :authentication => :plain,
    :enable_starttls_auto => true
}