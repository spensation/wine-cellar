class AddAppellationIdToProducer < ActiveRecord::Migration[5.1]
  def change
    add_column :producers, :appellation_id, :integer
  end
end
