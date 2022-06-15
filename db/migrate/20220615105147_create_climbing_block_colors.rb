class CreateClimbingBlockColors < ActiveRecord::Migration[5.2]
  def change
    create_table :climbing_block_colors do |t|
      t.string :block_color

      t.timestamps
    end
  end
end
