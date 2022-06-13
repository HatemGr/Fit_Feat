class RunningPerformance < ApplicationRecord
  belongs_to :sport_user

  validates :distance, :speed, numericality: { only_integer: true , :greater_than_or_equal_to => 0}
end
