class RenameUserColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :user_id, :registration_id
  end
end
