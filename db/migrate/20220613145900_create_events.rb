class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :admin
      t.references :sport, foreign_key: true
      t.references :city, foreign_key: true
      t.string :title
      t.string :description
      t.datetime :date
      t.string :duration
      t.string :address
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
