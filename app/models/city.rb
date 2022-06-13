class City < ApplicationRecord
  has_many :users
  has_many :events, dependent: :delete_all
end
