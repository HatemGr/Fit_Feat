class Participation < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates_uniqueness_of :event, :scope => [:user]
  validate :admin_not_participant

  def admin_not_participant
    errors.add(:user, "is admin and can't be participant") if (user == self.event.admin)
  end
end
