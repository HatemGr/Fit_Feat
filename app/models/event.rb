class Event < ApplicationRecord
  extend Geocoder::Model::ActiveRecord
  belongs_to :admin, class_name: 'User'
  belongs_to :sport
  belongs_to :city

  has_many :participations, dependent: :delete_all
  has_many :users, through: :participations
  has_one_attached :image

  geocoded_by :full_address
  after_validation :geocode, :start_after_now, :has_city, :has_sport, :has_address, :has_title

  def start_after_now
    errors.add(:La, "date ne doit pas être dans le passé") if date.present? && date < Date.today
  end

  def has_city
    errors.add(:La, "ville doit être renseignée") if city.nil? 
  end

  def has_sport
    errors.add(:Le, "sport doit être selectionné") if sport.nil?
  end

  def has_address
    errors.add(:Une, " adresse doit être indiquée") unless address.present?
  end

  def has_title
    errors.add(:Le, "titre doit avoir au moins 4 caractères") if title.nil? || title.length < 4
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
