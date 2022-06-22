class SportUsersController < ApplicationController
  
  def show
    @user= current_user
  end

  def create
    @user = current_user
    @sport_user = SportUser.new
    @sport = Sport.find_by(name: params[:sport])
    sport_user = SportUser.find_by(sport:@sport, user:current_user)
    unless sport_user
      sport_user = SportUser.create(user:current_user,sport: @sport,experience:0,frequency:0, perf_score: 0)
    end
    puts params
    puts"*"*50
    @url = "users/performances/#{@sport.name.downcase}_edit_form"
    case @sport.name 
    when "Climbing"
      ClimbingPerformance.create(sport_user:sport_user,level:5,block_color:"vert")
    when "Running"
      RunningPerformance.create(sport_user:sport_user,distance:0,speed:0)
    when "Workout"
      WorkoutPerformance.create(sport_user:sport_user,benchpress_weight:0,squat_weight:0)
    when "Tennis"
      TennisPerformance.create(sport_user:sport_user,rank:"6")
    end
    
    respond_to do |format|

format.js { }
      # format.html { redirect_to sport_user_path(current_user)}
    end

  end

  def update
  end

  def destroy
    @sport_user = SportUser.find(params[:id])
    @sport = @sport_user.sport.name
    @sport_user.destroy

    redirect_to sport_user_path(current_user)
  end




end
