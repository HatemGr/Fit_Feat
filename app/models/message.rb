class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  after_create :create_notification

  def self.sent_messages(user)
    Message.where(sender: user)
  end

  def self.received_messages(user)
    Message.where(recipient: user)
  end

  def friend_message(user)
    if sender == user
      recipient
    else
      sender
    end
  end

  def create_notification
    if Notification.find_by(user: recipient, content: "Tu as reçu un message de #{sender.full_name}.", viewed: false).nil?
      Notification.create(user: recipient, content: "Tu as reçu un message de #{sender.full_name}.")
    end
  end

end
