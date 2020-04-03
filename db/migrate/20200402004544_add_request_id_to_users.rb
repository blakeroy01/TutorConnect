class AddRequestIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :request_id, :integer, array: true
  end
end
