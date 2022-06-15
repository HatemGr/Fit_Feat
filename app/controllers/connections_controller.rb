class ConnectionsController < ApplicationController
    def index 
        @suggestions = 
        @friends = Connection.where(user: current_user)
    end
    
    def show

    end
end
