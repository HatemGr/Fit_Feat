class AddMaxParticipantsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :max_participants, :integer, default: nil
  end
end
