class ConnectionsController < ApplicationController
    def index 
        @suggestions = 
        @friends = Connection.where(user: current_user)
    end
end
