class Connection < ApplicationRecord
  belongs_to :friend, class_name: "User"
  belongs_to :user

  validates_uniqueness_of :friend, :scope => [:user]
  after_create :create_pair_connection, :create_notification

  def create_pair_connection
    if Connection.find_by(friend: user, user: friend).nil?
      Connection.create(friend: user, user: friend)
    end
  end

  def create_notification
    Notification.create(user: self.user, content: "Tu es maintenant ami avec #{self.friend.full_name}.")
  end

end
