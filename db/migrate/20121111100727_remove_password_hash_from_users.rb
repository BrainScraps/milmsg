class RemovePasswordHashFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :password_hash
    rename_column :users, :password_digest, :password
  end
 
  def down
    add_column :users, :password_hash, :string
    rename_column :users, :password, :password_digest
  end
end
