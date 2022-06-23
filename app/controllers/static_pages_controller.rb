class StaticPagesController < ApplicationController
  
  def index
  end

  def create
    User.where(is_admin: true).each do |admin|
      ContactMailer.contact(admin.email, params[:contact_email], params[:contact_message]).deliver_now
    end
    ContactMailer.confirmation(params[:contact_email], params[:contact_message]).deliver_now
    flash[:success] = "Message a bien été envoyé"
    redirect_to home_path
  end
end