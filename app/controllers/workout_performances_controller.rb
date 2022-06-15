class WorkoutPerformancesController < ApplicationController
    def create
        experience = params[:workout_performances][:experience]
        frequency = params[:workout_performances][:frequency]
        current_user.get_sport_user("Workout").update(experience: experience, frequency: frequency)
        WorkoutPerformance.create(workout_perf_params.merge(sport_user: current_user.get_sport_user("Workout")))
        redirect_to user_path(current_user)
    end

    def workout_perf_params
        params.require(:workout_performances).permit(:benchpress_weight, :squat_weight)
    end
end
