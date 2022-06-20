class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authenticate_user, only: [:edit, :show, :update, :new]

  def index
    @users = User.all
  end

  def show
    @user_events = @user.events_after_now.limit(5)
    @user_notifications = @user.notifications.where(viewed: false).order(created_at:'desc')
  end

  def new
    @user = User.new
  end

  def edit
    redirect_to edit_user_path(current_user) unless current_user == @user
    @cities = City.all
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = "Ton compte à bien été modifié"
        format.html { redirect_to user_url(@user)}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    flash[:error] = "Ton compte à bien été supprimé"
    redirect_to home_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :encrypted_password, :description, :first_name, :last_name, :address, :city_id)
    end

    def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_user_registration_path 
      end
    end
end
