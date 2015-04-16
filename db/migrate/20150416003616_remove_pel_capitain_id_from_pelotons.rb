class RemovePelCapitainIdFromPelotons < ActiveRecord::Migration
  def change
		remove_column :pelotons, :PelCaptainID
  end
end
