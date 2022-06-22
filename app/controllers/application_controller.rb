class ApplicationController < ActionController::Base
  include ParticipationsHelper

  def after_sign_in_path_for(_resource)
    user_path(current_user) # your path
  end
end
