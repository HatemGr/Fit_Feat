class ConnectionsController < ApplicationController
  before_action :set_user, only: %i[index]
  before_action :authenticate_user, only: [:index]

  def index 
    @suggestions = current_user.suggestions
    @friends = current_user.friends

    if @user.latitude
      @markers = @user.nearbys(10).geocoded.map do |user|
        {
          lat: user.latitude,
          lng: user.longitude,
          name: user.full_name,
          user_id: user.id,
        }
      end
      @markers << {lat: @user.latitude,
        lng: @user.longitude,
        name: @user.full_name,
        user_id: @user.id,}
    end

  end
  
  def show

  end

  private

  def set_user
      @user = User.find(params[:user_id])
  end

  def authenticate_user
    unless current_user
        flash[:danger] = "Veuillez vous inscrire"
        redirect_to new_user_registration_path 
    end

    unless current_user == @user 
      flash[:danger] = "Vous n'avez pas acces à cette page."
      redirect_to user_path(current_user)
    end
  end
end
