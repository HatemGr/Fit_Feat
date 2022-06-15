class RegistrationsController < Devise::RegistrationsController
    
    protected

    def after_sign_up_path_for(resource)
        edit_user_path(@user)
    end

    def set_user
        @user = User.find(params[:id])
    end
  
end