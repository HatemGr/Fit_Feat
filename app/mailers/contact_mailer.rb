class ContactMailer < ApplicationMailer
    default to: 'no_reply-fit-feat@yopmail.com'
    default from: 'no_reply-fit-feat@yopmail.com'

    def contact(email, contact, message)
        @email = contact
        @message = message
        @city = City.first
        mail(to: email, subject: 'Contact')
    end

    def confirmation(email, message)
        @email = email
        @message = message
        @city = City.first
        @url = 'https://fit-feat.herokuapp.com/users/sign_up'
        mail(to: @email, subject: "Confirmation d'envoi")
    end
end
