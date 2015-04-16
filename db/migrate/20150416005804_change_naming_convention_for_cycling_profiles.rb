class ChangeNamingConventionForCyclingProfiles < ActiveRecord::Migration
  def change
		drop_table :cycling_profs

		create_table :cycling_profiles do |t|
			t.belongs_to :rider
			t.string :genre
			t.string :pace_preference
			t.date :year_started
			t.string :group_preference
		end
  end
end
