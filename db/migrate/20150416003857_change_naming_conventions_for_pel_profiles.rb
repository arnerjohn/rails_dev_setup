class ChangeNamingConventionsForPelProfiles < ActiveRecord::Migration
  def change
		drop_table :pel_profiles

		create_table :pelotonia_profiles do |t|
			t.belongs_to :rider, index: true
			t.integer :years_ridden
			t.boolean :living_proof, default: false
			t.boolean :high_roller, default: false
			t.boolean :scholar, default: false
			t.boolean :pace_setter, default: false
			t.boolean :road_lead, default: false
			t.boolean :ground_lead, default: false	
		end
  end
end
