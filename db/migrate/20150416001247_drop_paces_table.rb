class DropPacesTable < ActiveRecord::Migration
  def change
		drop_table :paces
  end
end
