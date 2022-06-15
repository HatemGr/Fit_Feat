class RunningPerformancesController < ApplicationController

    def create
        RunningPerformance.create(running_perf_params.merge(sport_user: current_user.get_sport_user("Running")))
        redirect_to user_path(current_user)
    end

    private

    def running_perf_params
        params.require(:running_performances).permit(:speed, :distance)
    end
end
