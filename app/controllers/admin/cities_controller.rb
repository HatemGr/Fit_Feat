class Admin::CitiesController < ApplicationController
  before_action :set_city, only: %i[ show edit update destroy ]
  before_action :require_admin  

  # GET /events or /events.json
  def index
    @cities = City.all.order(name:"asc")
  end


  def show

  end


  def new

  end


  def edit

  end


  def create

  end

  def update

  end


  def destroy
    @city.destroy
    flash[:error] = "La ville a bien ete supprimee supprimé"
    redirect_to admin_events_path
  end

  private
    def set_city
      @city = City.find(params[:id])
    end

    def require_admin
      unless current_user && current_user.is_admin
        flash[:danger] = "You are not admin"
        redirect_to home_path
      end
    end
    
end
