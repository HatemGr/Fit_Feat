class WorkoutPerformance < ApplicationRecord
  belongs_to :sport_user

  validates :benchpress_weight, :squat_weight, numericality: { only_integer: true , :greater_than_or_equal_to => 0}
  after_validation :calc_perf_score, :remake_suggestions

  def remake_suggestions
    Suggestion.make_suggestions(self.sport_user.user)
  end

  def calc_perf_score 
    score = 0
    if benchpress_weight < 30
      score +=2
      elsif benchpress_weight < 50
        score +=4
      elsif benchpress_weight < 70
        score +=6
      elsif benchpress_weight < 90
        score +=8
      else
        score += 10
    end

    if squat_weight < 40
      score +=2
      elsif squat_weight < 60
        score +=4
      elsif squat_weight < 80
        score +=6
      elsif squat_weight < 100
        score +=8
      else
        score += 10
    end

    score /= 2

    SportUser.find(self.sport_user_id).update(perf_score: score)
  end
end
