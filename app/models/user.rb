class User < ApplicationRecord
  extend Geocoder::Model::ActiveRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :city, optional: true

  has_many :admin_events, foreign_key: 'admin_id', class_name: "Event", dependent: :delete_all
  has_many :participations, dependent: :delete_all
  has_many :events, through: :participations
  has_many :sport_users, dependent: :delete_all
  has_many :sports , through: :sport_users
  has_many :suggestions, dependent: :delete_all
  has_many :connections, dependent: :delete_all
  has_many :friends, through: :connections, class_name: "User"

  validates :first_name, :last_name, length: { maximum: 15 }

  after_create :welcome_send

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? && obj.address_changed? }

  def full_name
    "#{first_name} #{last_name}"
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def running_perf
    RunningPerformance.where(sport_user: SportUser.where(sport: Sport.find_by(name:"Running"), user: self))
  end

  def last_running_perf
    self.running_perf.order(:created_at).last
  end

  def workout_perf
    WorkoutPerformance.where(sport_user: SportUser.where(sport: Sport.find_by(name:"Workout"), user: self))
  end

  def last_workout_perf
    self.workout_perf.order(:created_at).last
  end

  def tennis_perf
    TennisPerformance.where(sport_user: SportUser.where(sport: Sport.find_by(name:"Tennis"), user: self))
  end

  def last_tennis_perf
    self.tennis_perf.order(:created_at).last
  end

  def climbing_perf
    ClimbingPerformance.where(sport_user: SportUser.where(sport: Sport.find_by(name:"Climbing"), user: self))
  end

  def last_climbing_perf
    self.climbing_perf.order(:created_at).last
  end

  def distance_with(user_2)
    Geocoder::Calculations.distance_between([longitude,latitude], [user_2.longitude,user_2.latitude])
  end

  def users_around(n)
    self.nearbys(n)
  end

end
