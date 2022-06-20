class Participation < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates_uniqueness_of :event, :scope => [:user]
  validate :admin_not_participant, :check_event_availability

  after_create :create_notification

  def admin_not_participant
    errors.add(:user, "is admin and can't be participant") if (user == self.event.admin)
  end

  def create_notification
    Notification.create(user: self.event.admin, content: "#{self.user.full_name} va participer à ton évenement #{self.event.title}")
  end

  def check_event_availability 
    errors.add(:user, "Event is full, sorry") if event.is_full?
  end
end
