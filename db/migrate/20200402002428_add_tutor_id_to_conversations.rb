class AddTutorIdToConversations < ActiveRecord::Migration[5.1]
  def change
    add_column :conversations, :tutor_id, :integer
  end
end
