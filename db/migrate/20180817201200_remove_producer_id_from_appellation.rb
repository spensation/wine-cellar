class RemoveProducerIdFromAppellation < ActiveRecord::Migration[5.1]
  def change
  	remove_column :appellations, :producer_id
  end
end
