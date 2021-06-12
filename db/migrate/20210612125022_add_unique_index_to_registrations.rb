class AddUniqueIndexToRegistrations < ActiveRecord::Migration[6.0]
  def change
    add_index :registrations, [:user_id, :event_id], unique: true
  end
end
