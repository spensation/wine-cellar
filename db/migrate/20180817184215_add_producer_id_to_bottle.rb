class AddProducerIdToBottle < ActiveRecord::Migration[5.1]
  def change
    add_column :bottles, :producer_id, :integer
  end
end
