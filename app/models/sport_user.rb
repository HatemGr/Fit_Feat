class SportUser < ApplicationRecord
  belongs_to :sport
  belongs_to :user
  has_one :running_performance, dependent: :destroy
  has_one :workout_performance, dependent: :destroy
  has_one :climbing_performance, dependent: :destroy
  has_one :tennis_performance, dependent: :destroy

  validates :experience, :frequency, numericality: { only_integer: true , :greater_than_or_equal_to => 0}
  validates_uniqueness_of :user, :scope => [:sport]
 

end
