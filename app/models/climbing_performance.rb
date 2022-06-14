class ClimbingPerformance < ApplicationRecord
  belongs_to :sport_user

  after_validation :calc_perf_score


  def calc_perf_score 
    score = 0
    case level 
    when 5
      score += 2
    when 6
      score += 4
    when 7
      score += 8
    when 8
      score += 10
    end

    case block_color
    when "vert"
      score += 2
    when "bleu"
      score += 4
    when "rouge"
      score += 6
    when "violet"
      score += 8
    when "orange"
      score += 10
    end

    score /= 2

    SportUser.find(self.sport_user_id).update(perf_score: score)
  end



end
