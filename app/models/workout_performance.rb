class WorkoutPerformance < ApplicationRecord
  belongs_to :sport_user

  validates :benchpress_weight, :squat_weight, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_create :calc_perf_score, :remake_suggestions

  def remake_suggestions
    Suggestion.make_suggestions(sport_user.user)
  end

  def calc_perf_score
    score = 0
    score += if benchpress_weight < 30
               2
             elsif benchpress_weight < 50
               4
             elsif benchpress_weight < 70
               6
             elsif benchpress_weight < 90
               8
             else
               10
             end

    score += if squat_weight < 40
               2
             elsif squat_weight < 60
               4
             elsif squat_weight < 80
               6
             elsif squat_weight < 100
               8
             else
               10
             end

    score /= 2

    SportUser.find(sport_user_id).update(perf_score: score)
  end
end
