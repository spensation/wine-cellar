class AddCategoryToBottle < ActiveRecord::Migration[5.1]
  def change
    add_column :bottles, :category, :string
  end
end
