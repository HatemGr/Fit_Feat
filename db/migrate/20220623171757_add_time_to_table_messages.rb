class AddTimeToTableMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :time, :string 
  end
end
