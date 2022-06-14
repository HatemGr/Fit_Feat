class ClimbingPerformancesController < ApplicationController

    def create
        ClimbingPerformance.create(climbing_perf_params.merge(sport_user: current_user.get_sport_user("Climbing")))
        redirect_to user_path(current_user)
    end

    def climbing_perf_params
        params.require(:climbing_performance).permit(:level, :block_color)
    end

end
