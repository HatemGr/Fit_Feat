class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :authenticate_user

  # GET /events or /events.json
  def index
    @events = Event.available_events(current_user).select{|e| current_user.admin_events.exclude?(e)}
    @current_user_events = current_user.admin_events.select{|e| e.is_after_today?}
  end

  # GET /events/1 or /events/1.json
  def show
    @cities = City.all
    @sports = Sport.all
    
  end

  # GET /events/new
  def new
    @event = Event.new
    @cities = City.all
    @sports = Sport.all
  end

  # GET /events/1/edit
  def edit
    @cities = City.all
    @sports = Sport.all
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.update(admin: current_user)
    @event.update(max_participants: params[:event][:max_participants].to_i) if params[:event][:max_participants].present? 
    @sports = Sport.all
    @cities = City.all
    @event.image.attach(params[:image])
    

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    @cities = City.all
    @sports = Sport.all
    respond_to do |format|
      if @event.update(event_params)
        @event.update(max_participants: params[:event][:max_participants].to_i) if params[:event][:max_participants].present? 
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:admin_id, :sport_id, :city_id, :title, :description, :date, :address, :longitude, :latitude, :image)
    end

    def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_user_registration_path 
      end
    end
    
end
