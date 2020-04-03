class AddConversationIdsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :conversation_ids, :integer, array: true
  end
end
