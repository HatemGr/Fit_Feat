class Event < ApplicationRecord
  extend Geocoder::Model::ActiveRecord
  belongs_to :admin, class_name: 'User'
  belongs_to :sport
  belongs_to :city

  has_many :participations, dependent: :delete_all
  has_many :users, through: :participations
  has_one_attached :image

  validate :start_after_now, on: :create
  validates :title, :date, presence: true
  validates :title, length: { in: 4..30 }
  validates :address, presence: true

  geocoded_by :full_address
  after_validation :geocode, :start_after_now

  def start_after_now
    errors.add(:date, "can't be in the past") if date.present? && date < Date.today
  end

  def full_address
    [address, city.name].compact.join(', ') if city
  end

  def is_after_today?
    date > Date.today
  end

  def self.available_events(user)
    Event.all.order(date: 'asc').near(user.to_coordinates, 10, units: :km)
  end

  def is_full?
    max_participants.present? && max_participants.to_i == participations.size
  end
end
