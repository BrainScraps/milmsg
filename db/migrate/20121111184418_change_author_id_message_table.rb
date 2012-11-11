class ChangeAuthorIdMessageTable < ActiveRecord::Migration
  def up
  	rename_column :messages, :author_id, :user_id
  end

  def down
  	rename_column :messages, :user_id, :author_id 
  end
end
