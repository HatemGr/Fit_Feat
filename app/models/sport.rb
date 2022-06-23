class Sport < ApplicationRecord
  has_many :sport_users, dependent: :delete_all
  has_many :users, through: :sport_users

  validates_uniqueness_of :name


  def french
    case self.name
    when "Climbing"
      "Escalade"
    when "Running"
      "Course"
    when "Workout"
      "Musculation"
    else
      self.name
    end
  end
end
