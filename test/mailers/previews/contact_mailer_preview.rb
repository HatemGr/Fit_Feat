# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

    def contact
        ContactMailer.contact("lili@email.com", "je suis en bas de chez toi" )
    end

end
