class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :org_id
      t.integer :position_id

      t.timestamps
    end
  end
end
