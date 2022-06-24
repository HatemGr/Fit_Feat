class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user

  # GET /events or /events.json
  def index
    @events = Event.available_events(current_user).select { |e| current_user.admin_events.exclude?(e) }
    @current_user_events = current_user.admin_events.select { |e| e.is_after_today? }
    @cities = City.all.order(name: 'asc')
  end

  # GET /events/1 or /events/1.json
  def show
    @cities = City.all
    @sports = Sport.all

    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  # GET /events/new
  def new
    @event = Event.new
    @cities = City.all
    @sports = Sport.all
  end

  # GET /events/1/edit
  def edit
    redirect_to user_path(current_user) unless current_user == @event.admin
    @cities = City.all
    @sports = Sport.all
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.update(admin: current_user)
    if params[:event][:max_participants].present?
      @event.update(max_participants: params[:event][:max_participants].to_i)
    end
    @sports = Sport.all
    @cities = City.all
    @event.image.attach(params[:image])

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: " L'événement à bien été créé. " }

      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    @cities = City.all
    @sports = Sport.all
    respond_to do |format|
      if @event.update(event_params)
        if params[:event][:max_participants].present?
          @event.update(max_participants: params[:event][:max_participants].to_i)
        end
        format.html { redirect_to event_url(@event), notice: " L'événement à bien été mis à jour. " }

      else
        format.html { render :edit }

      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.participations.each do |participation|
      Notification.create(user: participation.user, content: "L'evenement #{@event.title} à été annulé.")
    end
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: " L'événement à bien été détruit. " }

    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:admin_id, :sport_id, :city_id, :title, :description, :date, :address, :longitude,
                                  :latitude, :image,:duration)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Veuillez vous connecter"
      redirect_to new_user_registration_path
    end
  end
end
