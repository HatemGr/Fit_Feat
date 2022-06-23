class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  after_create :set_time

  def set_time
    time_paris = Time.now
    self.update(time: time_paris.strftime("à %kh%M"))
  end

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
end
