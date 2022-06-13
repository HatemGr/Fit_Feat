class SportUser < ApplicationRecord
  belongs_to :sport
  belongs_to :user
  has_one :running_performance
  has_one :workout_performance
  has_one :climbing_performance
  has_one :tennis_performance
end
