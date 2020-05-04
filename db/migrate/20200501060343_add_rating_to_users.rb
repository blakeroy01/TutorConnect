class AddRatingToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :rating, :integer
  end
end
