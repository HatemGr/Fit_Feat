class CreateClimbingPerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :climbing_performances do |t|
      t.references :sport_user, foreign_key: {on_delete: :cascade}
      t.integer :level, default: 0
      t.string :block_color, default: 'Unknown'

      t.timestamps
    end
  end
end
