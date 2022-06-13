class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.references :partner, index: true
      t.references :user, index: true
      t.boolean :accepted
      t.boolean :refused

      t.timestamps
    end
  end
end
