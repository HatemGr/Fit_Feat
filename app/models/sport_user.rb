class SportUser < ApplicationRecord
  belongs_to :sport
  belongs_to :user
  has_one :running_performance
end
