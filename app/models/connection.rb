class Connection < ApplicationRecord
  belongs_to :friend, class_name: 'User'
  belongs_to :user

  validates_uniqueness_of :friend, scope: [:user]
  after_create :create_pair_connection, :create_notification

  def create_pair_connection
    Connection.create(friend: user, user: friend) if Connection.find_by(friend: user, user: friend).nil?
  end

  def create_notification
    Notification.create(user: user, content: "Tu es maintenant ami avec #{friend.full_name}.")
  end
end
