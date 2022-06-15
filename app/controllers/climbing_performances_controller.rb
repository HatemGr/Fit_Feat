class ClimbingPerformancesController < ApplicationController

    def create
        ClimbingPerformance.create(climbing_perf_params.merge(sport_user: current_user.get_sport_user("Climbing")))
        redirect_to user_path(current_user)
    end

    private

    def climbing_perf_params
        params.require(:climbing_performances).permit(:level, :block_color)
    end

end
