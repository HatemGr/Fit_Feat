class RunningPerformancesController < ApplicationController
  def create
    experience = params[:running_performances][:experience]
    frequency = params[:running_performances][:frequency]
    current_user.get_sport_user('Running').update(experience: experience, frequency: frequency)
    RunningPerformance.create(running_perf_params.merge(sport_user: current_user.get_sport_user('Running')))
    flash[:success] = 'Le sport Running a bien été modifié'
    redirect_to sport_user_path(current_user)
  end

  private

  def running_perf_params
    params.require(:running_performances).permit(:speed, :distance)
  end
end
