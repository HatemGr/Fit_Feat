class CreateWorkoutPerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_performances do |t|
      t.references :sport_user, foreign_key: { on_delete: :cascade }
      t.integer :benchpress_weight
      t.integer :squat_weight

      t.timestamps
    end
  end
end
