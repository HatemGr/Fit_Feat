class CreateTennisPerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :tennis_performances do |t|
      t.references :sport_user, foreign_key: { on_delete: :cascade }
      t.string :rank

      t.timestamps
    end
  end
end
