class UserMailer < ApplicationMailer
    default from: 'no_reply-fit-feat@yopmail.com'

    def welcome_email(user)
        @user = user 
        @url  = 'http://fit-feat.herokuapp.com/login' 
        mail(to: @user.email, subject: 'Bienvenue sur Fit Feat !') 
    end

    def password_email(user)
        @user = user 
        @url  = 'http://fit-feat.herokuapp.com/login' 
        mail(to: @user.email, subject: 'Bienvenue sur Fit Feat !') 
    end


end
