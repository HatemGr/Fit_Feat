class ParticipationsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @participation = Participation.new(event:@event,user:current_user)
    @events = Event.all.select{|e| current_user.admin_events.exclude?(e)}

    respond_to do |format|
      if @participation.save
        format.html { redirect_to events_path, notice: "participation was successfully created." }
        format.json { }
      else 
        format.html { redirect_to events_path, status: :unprocessable_entity,notice: @participation.errors }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @participation = Participation.find(params[:id])
    respond_to do |format|
      if @participation.destroy
        format.html { redirect_to events_path, notice: "participation was successfully destroyed." }
        format.json { }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end
end
