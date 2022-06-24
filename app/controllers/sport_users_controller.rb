class SportUsersController < ApplicationController

  def show
    @user= current_user
    @ranks = ['6', '15/1', '15/2', '15/3', '15/4', '15/5', '30', '30/1', '30/2', '30/3', '30/4', '40']
    @levels = [5,6,7,8]
    @block_colors = ["vert","bleu","rouge","violet","orange"]
  end


  def create
    @user = current_user
    @sport_user = SportUser.new
    @sport = Sport.find_by(name: params[:sport])
    sport_user = SportUser.find_by(sport:@sport, user:current_user)
    @ranks = ['6', '15/1', '15/2', '15/3', '15/4', '15/5', '30', '30/1', '30/2', '30/3', '30/4', '40']
    @levels = [5,6,7,8]
    @block_colors = ["vert","bleu","rouge","violet","orange"]
    unless sport_user
      sport_user = SportUser.create(user:current_user,sport: @sport,experience:0,frequency:0, perf_score: 0)
    end
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
    end
  end

  def update; end

  def destroy
    @sport_user = SportUser.find(params[:id])
    @sport = @sport_user.sport.name
    @sport_user.destroy
    redirect_to sport_user_path(current_user)
  end

end
