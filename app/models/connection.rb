class Connection < ApplicationRecord
  belongs_to :friend, class_name: "User"
  belongs_to :user

  validates_uniqueness_of :friend, :scope => [:user]
end
