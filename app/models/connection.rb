class Connection < ApplicationRecord
  belongs_to :friend, class_name: "User"
  belongs_to :user

  validates_uniqueness_of :friend, :scope => [:user]
  after_create :create_pair_connection

  def create_pair_connection
    if Connection.find_by(friend: user, user: friend).nil?
      Connection.create(friend: user, user: friend)
    end
  end

end
