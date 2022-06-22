class Participation < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates_uniqueness_of :event, scope: [:user]
  validate :admin_not_participant, :check_event_availability

  after_create :create_notification

  def admin_not_participant
    errors.add(:user, "is admin and can't be participant") if user == event.admin
  end

  def create_notification
    Notification.create(user: event.admin,
                        content: "#{user.full_name} va participer à ton évenement #{event.title}")
  end

  def check_event_availability
    errors.add(:user, 'Event is full, sorry') if event.is_full?
  end
end
