class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :city, optional: true
  has_many :admin_events, foreign_key: 'admin_id', class_name: "Event", dependent: :delete_all
  has_many :participations, dependent: :delete_all
  has_many :events, through: :participations



end
