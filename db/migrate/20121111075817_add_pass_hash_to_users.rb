class AddPassHashToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pass_hash, :string
  end
end
