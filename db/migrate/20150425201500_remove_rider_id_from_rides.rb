class RemoveRiderIdFromRides < ActiveRecord::Migration
  def change
    remove_column :rides, :rider_id, :string
  end
end
