class TennisPerformance < ApplicationRecord
  belongs_to :sport_user
  after_validation :calc_perf_score, :remake_suggestions

  def remake_suggestions
    Suggestion.make_suggestions(self.sport_user.user)
  end

  def calc_perf_score 
    ranks = 0
    case rank 
    when "6"
      score += 1
    when "15/1"
      score += 2
    when "15/2"
      score += 3
    when "15/3"
      score += 4
    when "15/4"
      score += 5
    when "15/5"
      score += 6
    when "30"
      score += 7
    when "30/1"
      score += 8
    when "30/2"
      score += 9
    when "30/3"
      score += 10
    when "30/4"
      score += 10
    when "40"
      score += 10
    end

    SportUser.find(self.sport_user_id).update(perf_score: score)
  end


end
