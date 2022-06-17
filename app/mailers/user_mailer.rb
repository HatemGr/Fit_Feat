class UserMailer < ApplicationMailer
    default from: 'no_reply-fit-feat@yopmail.com'

    def welcome_email(user)
        @user = user 
        @url  = 'http://fit-feat.herokuapp.com/users/sign_in' 
        mail(to: @user.email, subject: 'Bienvenue sur Fit Feat !') 
    end

    def notification_email(user)
        @user = user 
        @url  = 'http://fit-feat.herokuapp.com/users/sign_in' 
        mail(to: @user.email, subject: "Un partenaire t'a ajouté sur Fit Feat !") 
    end

end
