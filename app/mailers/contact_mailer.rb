class ContactMailer < ApplicationMailer
    default to: 'no_reply-fit-feat@yopmail.com'

    def contact(email, message)
        puts "/"*50
        @email = email
        @message = message
        @city = City.first
        mail(to: 'fit-feat@yopmail.com', subject: 'Contact')
    end
end
