class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.timestamp :timestamp
      t.integer :author_id
      t.string :target_json

      t.timestamps
    end
  end
end
