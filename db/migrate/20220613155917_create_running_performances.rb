class CreateRunningPerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :running_performances do |t|
      t.references :sport_user, foreign_key: true
      t.integer :distance
      t.integer :speed

      t.timestamps
    end
  end
end
