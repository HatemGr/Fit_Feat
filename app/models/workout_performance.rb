class WorkoutPerformance < ApplicationRecord
  belongs_to :sport_user

  validates :benchpress_weight, :squat_weight, numericality: { only_integer: true , :greater_than_or_equal_to => 0}
end
