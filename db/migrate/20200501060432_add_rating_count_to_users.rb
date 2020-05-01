class AddRatingCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :rating_count, :integer
  end
end
