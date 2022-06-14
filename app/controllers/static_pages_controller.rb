class StaticPagesController < ApplicationController
   def index
   end
 
   def new
    if current_user
      redirect_to user_path(current_user)
    end
   end
 end