class User < ApplicationRecord
  extend Geocoder::Model::ActiveRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :city, optional: true

  has_many :admin_events, foreign_key: 'admin_id', class_name: 'Event', dependent: :delete_all
  has_many :participations, dependent: :delete_all
  has_many :events, through: :participations
  has_many :sport_users, dependent: :destroy
  has_many :sports, through: :sport_users
  has_many :suggestions, dependent: :destroy
  has_many :connections, dependent: :destroy
  has_many :friends, through: :connections, class_name: 'User'
  has_many :notifications, dependent: :delete_all
  has_many :messages
  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'Message'
  has_many :received_messages, foreign_key: 'recipient_id', class_name: 'Message'
  has_one_attached :avatar

  validates :first_name, :last_name, length: { maximum: 15 }
  after_create :welcome_send
  before_update :remake_suggestions

  geocoded_by :full_address
  after_validation :geocode
  # if: ->(obj){ obj.full_address.present? && obj.address_changed? }

  def full_name
    if first_name.present? || last_name.present?
      "#{first_name} #{last_name}"
    else
      'Utilisateur anonyme'
    end
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def full_address
    if city
      if address
        [address, city.name].compact.join(', ')
      else
        city.name
      end
    end
  end

  def remake_suggestions
    Suggestion.make_suggestions(self) if address_changed? || city_id_changed?
  end

  def running_perf
    RunningPerformance.where(sport_user: SportUser.where(sport: Sport.find_by(name: 'Running'), user: self))
  end

  def last_running_perf
    running_perf.order(:created_at).last
  end

  def running_freq
    SportUser.find_by(sport: Sport.find_by(name: 'Running'), user: self).frequency
  end

  def running_exp
    SportUser.find_by(sport: Sport.find_by(name: 'Running'), user: self).experience
  end

  def workout_perf
    WorkoutPerformance.where(sport_user: SportUser.where(sport: Sport.find_by(name: 'Workout'), user: self))
  end

  def last_workout_perf
    workout_perf.order(:created_at).last
  end

  def workout_freq
    SportUser.find_by(sport: Sport.find_by(name: 'Workout'), user: self).frequency
  end

  def workout_exp
    SportUser.find_by(sport: Sport.find_by(name: 'Workout'), user: self).experience
  end

  def tennis_perf
    TennisPerformance.where(sport_user: SportUser.where(sport: Sport.find_by(name: 'Tennis'), user: self))
  end

  def last_tennis_perf
    tennis_perf.order(:created_at).last
  end

  def tennis_freq
    SportUser.find_by(sport: Sport.find_by(name: 'Tennis'), user: self).frequency
  end

  def tennis_exp
    SportUser.find_by(sport: Sport.find_by(name: 'Tennis'), user: self).experience
  end

  def climbing_perf
    ClimbingPerformance.where(sport_user: SportUser.where(sport: Sport.find_by(name: 'Climbing'), user: self))
  end

  def last_climbing_perf
    climbing_perf.order(:created_at).last
  end

  def climbing_freq
    SportUser.find_by(sport: Sport.find_by(name: 'Climbing'), user: self).frequency
  end

  def climbing_exp
    SportUser.find_by(sport: Sport.find_by(name: 'Climbing'), user: self).experience
  end

  def distance_with(user_2)
    Geocoder::Calculations.distance_between([longitude, latitude], [user_2.longitude, user_2.latitude])
  end

  def users_around(n)
    nearbys(n)
  end

  def get_sport_user(sport)
    SportUser.find_by(sport: Sport.find_by(name: sport).id, user: self)
  end

  def does_climbing?
    !SportUser.find_by(user: self, sport: Sport.find_by(name: 'Climbing')).nil?
  end

  def does_running?
    !SportUser.find_by(user: self, sport: Sport.find_by(name: 'Running')).nil?
  end

  def does_tennis?
    !SportUser.find_by(user: self, sport: Sport.find_by(name: 'Tennis')).nil?
  end

  def does_workout?
    !SportUser.find_by(user: self, sport: Sport.find_by(name: 'Workout')).nil?
  end

  def events_after_now
    events ? events.where('date > ?', Date.today) : nil
  end

  def is_friend_with?(user)
    user.friends.include?(self)
  end

  def conversation(user)
    Message.where(sender: user, recipient: self).or(Message.where(sender: self, recipient: user)).order(:created_at)
  end

  def last_message(user)
    conversation(user).last
  end

  def has_one_conversation
    conversation = []
    answer = false
    if friends.present?
      friends.each do |friend|
        if self.conversation(friend).present?
          conversation = self.conversation(friend)
          answer = true
        end
      end
    end
    conversation if answer
  end

  def sports_list
    list = []
    sports.each do |sport|
      list << sport.name
    end
    list
  end

  def has_unread_message_with(user)
    conversation = self.conversation(user)
    return conversation.where(recipient: self, sender: user, read: nil).present?
  end
end
