class CreateClimbingLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :climbing_levels do |t|
      t.integer :level

      t.timestamps
    end
  end
end
