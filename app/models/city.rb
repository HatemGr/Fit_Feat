class City < ApplicationRecord
  has_many :users
  has_many :events, dependent: :delete_all
  has_one_attached :image 

  geocoded_by :name
  after_validation :geocode

end
