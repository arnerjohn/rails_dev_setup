class ChangeNamingConventionForDistances < ActiveRecord::Migration
  def change
		drop_table :distances
  end
end
