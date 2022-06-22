class Admin::EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :require_admin

  def index
    @events = Event.all
  end

  def show; end

  def new; end

  def edit; end

  def create; end

  def update; end

  def destroy
    @event.destroy
    flash[:error] = "L'event a bien été supprimé"
    redirect_to admin_events_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def require_admin
    return if current_user&.is_admin
    
    flash[:danger] = 'You are not admin'
    redirect_to home_path
  end
end
