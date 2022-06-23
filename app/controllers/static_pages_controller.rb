class StaticPagesController < ApplicationController
  
  def index
  end

  def create
    puts"*"*50
    puts params
    ContactMailer.contact(params[:contact_email], params[:contact_message]).deliver_now
    flash[:success] = "Message a bien été envoyé"
    redirect_to home_path
  end
end