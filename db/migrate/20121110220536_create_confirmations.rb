class CreateConfirmations < ActiveRecord::Migration
  def change
    create_table :confirmations do |t|
      t.timestamp :timestamp
      t.integer :responder_id
      t.integer :message_id
      t.boolean :confirmed

      t.timestamps
    end
  end
end
