class AddUserIdToBottles < ActiveRecord::Migration[5.1]
  def change
    add_column :bottles, :user_id, :integer
  end
end
