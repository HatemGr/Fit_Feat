class Message < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  def self.sent_messages(user)
      Message.where(sender: user)
  end

  def self.received_messages(user)
    Message.where(recipient: user)
  end 
end
