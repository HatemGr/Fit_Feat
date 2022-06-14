class UserMailer < ApplicationMailer
    default from: 'team@fit-feat.com'

    def welcome_email(user)
        @user = user 
        @url  = 'http://fit-feat.herokuapp.com/login' 
        mail(to: @user.email, subject: 'Bienvenue sur Fit Feat !') 
    end

end
