class RunningPerformance < ApplicationRecord
  belongs_to :sport_user

  validates :distance, :speed, numericality: { only_integer: true , :greater_than_or_equal_to => 0}
  after_validation :calc_perf_score

  def calc_perf_score 
    score = 0
    if distance < 5
      score +=2
      elsif distance < 10
        score +=4
      elsif distance < 15
        score +=6
      elsif distance < 20
        score +=8
      else
        score += 10
    end

    if speed < 5
      score +=2
      elsif speed < 7
        score +=4
      elsif speed < 9
        score +=6
      elsif speed < 12
        score +=8
      else
        score += 10
    end

    score /= 2

    SportUser.find(self.sport_user_id).update(perf_score: score)
  end
end
