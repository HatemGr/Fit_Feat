class TennisPerformancesController < ApplicationController

    def create
        TennisPerformance.create(tennis_perf_params.merge(sport_user: current_user.get_sport_user("Tennis")))
        redirect_to user_path(current_user)
    end

    def tennis_perf_params
        params.require(:tennis_performance).permit(:rank)
    end
end
