class StaticPagesController < ApplicationController
  
  def index
  end

  def create
    ContactMailer.contact(params[:contact_email], params[:contact_message]).deliver_now
    ContactMailer.confirmation(params[:contact_email], params[:contact_message]).deliver_now
    flash[:success] = "Message a bien été envoyé"
    redirect_to home_path
  end
end