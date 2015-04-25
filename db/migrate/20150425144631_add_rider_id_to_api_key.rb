class AddRiderIdToApiKey < ActiveRecord::Migration
  def change
		remove_column :api_keys, :user_id
    add_column :api_keys, :rider_id, :integer
  end
end
