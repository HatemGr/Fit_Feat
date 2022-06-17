class Event < ApplicationRecord
  extend Geocoder::Model::ActiveRecord
  belongs_to :admin, class_name: "User"
  belongs_to :sport
  belongs_to :city

  has_many :participations, dependent: :delete_all
  has_many :users, through: :participations
  has_one_attached :image

  validate :start_after_now, on: :create
  validates :title, :date, presence: true
  validates :title, length: { in: 4..30 }

  geocoded_by :full_address
  after_validation :geocode, :start_after_now


  def start_after_now
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

  def full_address
    if city
      [address, city.name].compact.join(', ')
    end
  end

  def is_after_today? 
    date > Date.today
  end

  def self.available_events(user)
    Event.all.near(user.to_coordinates , 10, units: :km)
  end

end
