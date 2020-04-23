class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.time :time_sent
      t.string :message
      t.integer :conversation_id
      t.integer :user_id

      t.timestamps
    end
  end
end
