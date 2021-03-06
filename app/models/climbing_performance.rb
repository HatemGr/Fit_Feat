class ClimbingPerformance < ApplicationRecord
  belongs_to :sport_user
  after_create :calc_perf_score, :remake_suggestions

  def remake_suggestions
    Suggestion.make_suggestions(sport_user.user)
  end

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
    when 'vert'
      score += 2
    when 'bleu'
      score += 4
    when 'rouge'
      score += 6
    when 'violet'
      score += 8
    when 'orange'
      score += 10
    end

    score /= 2
    SportUser.find(sport_user_id).update(perf_score: score)
  end
end
