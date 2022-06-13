class CreateSportUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :sport_users do |t|
      t.references :sport, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :experience
      t.integer :frequency
      t.float :perf_score

      t.timestamps
    end
  end
end
