class AddStudentIdToConversations < ActiveRecord::Migration[5.1]
  def change
    add_column :conversations, :student_id, :integer
  end
end
