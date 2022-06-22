class RunningPerformance < ApplicationRecord
  belongs_to :sport_user

  validates :distance, :speed, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_create :calc_perf_score, :remake_suggestions

  def remake_suggestions
    Suggestion.make_suggestions(sport_user.user)
  end

  def calc_perf_score
    score = 0
    score += if distance < 5
               2
             elsif distance < 10
               4
             elsif distance < 15
               6
             elsif distance < 20
               8
             else
               10
             end

    score += if speed < 5
               2
             elsif speed < 7
               4
             elsif speed < 9
               6
             elsif speed < 12
               8
             else
               10
             end

    score /= 2

    SportUser.find(sport_user_id).update(perf_score: score)
  end
end
