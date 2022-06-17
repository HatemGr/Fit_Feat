class SportUser < ApplicationRecord
  belongs_to :sport
  belongs_to :user
  has_many :running_performance, dependent: :destroy
  has_many :workout_performance, dependent: :destroy
  has_many :climbing_performance, dependent: :destroy
  has_many :tennis_performance, dependent: :destroy

  validates :experience, :frequency, numericality: { only_integer: true , :greater_than_or_equal_to => 0}
  validates_uniqueness_of :user, :scope => [:sport]
 
  

end
