class NotificationsController < ApplicationController
  def index; end

  def create; end

  def update
    @user = User.find(params[:id])
    @user.notifications.where(viewed: false).update_all(viewed: true)
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.js {}
    end
  end

  def destroy; end
end
