class ChangeFriendsTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :friends, :connections
  end 
end
