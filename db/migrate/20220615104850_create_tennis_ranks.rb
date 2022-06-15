class CreateTennisRanks < ActiveRecord::Migration[5.2]
  def change
    create_table :tennis_ranks do |t|
      t.string :rank

      t.timestamps
    end
  end
end
