class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authenticate_user, only: %i[edit show update new]
  before_action :require_admin

  def index
    @users = User.all
  end

  def show; end

  def new; end

  def edit; end

  def create; end

  def update; end

  def destroy
    @user.destroy
    flash[:error] = 'Le compte a bien ete supprimé'
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authenticate_user
    unless current_user
      flash[:danger] = 'Please log in.'
      redirect_to new_user_registration_path
    end
  end

  def require_admin
    unless current_user && current_user.is_admin
      flash[:danger] = 'You are not admin'
      redirect_to home_path
    end
  end
end
