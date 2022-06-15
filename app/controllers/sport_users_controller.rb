class SportUsersController < ApplicationController
  def create
    sport = Sport.find_by(name: params[:sport])
    sport_user = SportUser.create(user:current_user,sport: sport,experience:0,frequency:0)
    
    case sport.name 
    when "Climbing"
      ClimbingPerformance.create(sport_user:sport_user,level:5,block_color:"vert")
    when "Running"
      RunningPerformance.create(sport_user:sport_user,distance:0,speed:0)
    when "Workout"
      WorkoutPerformance.create(sport_user:sport_user,benchpress_weight:0,squat_weight:0)
    when "Tennis"
      puts "%"* 50
      puts "%"* 50
      puts "%"* 50

      TennisPerformance.create(sport_user:sport_user,rank:"6")
    end

    redirect_to edit_user_path(current_user)
  end

  def update
  end

  def destroy
  end
end
