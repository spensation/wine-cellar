class CreateBottles < ActiveRecord::Migration[5.1]
  def change
    create_table :bottles do |t|
      t.string :name
      t.float :price
      t.integer :vintage

      t.timestamps
    end
  end
end
