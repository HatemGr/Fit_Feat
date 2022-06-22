class StaticPagesController < ApplicationController
  def index; end

  def new
    redirect_to user_path(current_user) if current_user
  end
end
