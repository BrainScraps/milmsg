class RemovePasswordHashFromUserss < ActiveRecord::Migration
  def up
  	remove_column :users, :pass_hash
  end

  def down
  	add_column :users, :pass_hash, :string
  end
end
