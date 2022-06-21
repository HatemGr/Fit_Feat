class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /messages or /messages.json
  def index
    @message = Message.new
    @conversation = current_user.has_one_conversation
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
    puts params
    #request create when the conversation has not begun yet
    if params[:new]
      @new_message = Message.new
      if params[:recipient_id].to_i ==0
        @recipient = User.find(params[:user].to_i)
      else
        @recipient = User.find(params[:recipient_id].to_i)
      end
    else
      #request create chen conversation already exists
      @already_conversation = true
      if params[:recipient_id].to_i ==0
        @recipient = User.find(params[:user].to_i)
      else
        @recipient = User.find(params[:recipient_id].to_i)
      end
      @new_message = Message.new
      @message = Message.create(message_params.merge(sender: current_user, recipient_id: params[:recipient_id]))
    end
    respond_to do |format|
        format.html { }
        format.js { }
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    #set the recipient for the form according the friend conversation
    @recipient = User.find(params[:user].to_i)
    #load the conversation with the friend
    @conversation = current_user.conversation(@recipient.id)
    @message.update(read: params[:read])
    @new_message = Message.new
    respond_to do |format|
        format.html { }
        format.js { }
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { }
      format.js { }
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
