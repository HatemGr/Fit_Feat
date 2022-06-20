class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /messages or /messages.json
  def index
    @messages_received = Message.received_messages(current_user)
    @messages_sent = Message.sent_messages(current_user)
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
    if current_user
      @friends = current_user.friends
    else
      alert("Vous n'avez pas d'amis!")
      redirect_to root
    end
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params.merge(sender: current_user))
    @friends = current_user.friends
    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, notice: "Message was successfully sent." }
        format.json {  }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { }
      end
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    @message.update(read: params[:read])
    respond_to do |format|
        format.html { }
        format.js { }
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:object, :body, :recipient_id, :read)
    end
end
