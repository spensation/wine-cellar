class CreateAppellations < ActiveRecord::Migration[5.1]
  def change
    create_table :appellations do |t|
      t.string :name
      t.string :tier
      t.string :region
      t.integer :country_id
      t.integer :producer_id

      t.timestamps
    end
  end
end
