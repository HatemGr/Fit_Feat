class TennisPerformancesController < ApplicationController
  def create
    experience = params[:tennis_performances][:experience]
    frequency = params[:tennis_performances][:frequency]
    TennisPerformance.create(tennis_perf_params.merge(sport_user: current_user.get_sport_user('Tennis')))
    current_user.get_sport_user('Tennis').update(experience: experience, frequency: frequency)
    flash[:success] = 'Le sport Tennis a bien été modifié'
    redirect_to sport_user_path(current_user)
  end

  private

  def tennis_perf_params
    params.require(:tennis_performances).permit(:rank)
  end
end
