class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.integer :messages_id

      t.timestamps
    end
  end
end
