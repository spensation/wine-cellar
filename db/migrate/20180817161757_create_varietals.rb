class CreateVarietals < ActiveRecord::Migration[5.1]
  def change
    create_table :varietals do |t|
      t.string :name
      t.string :country_of_origin
      t.integer :appellation_id

      t.timestamps
    end
  end
end
