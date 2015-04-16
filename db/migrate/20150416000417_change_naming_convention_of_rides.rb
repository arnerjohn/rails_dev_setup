class ChangeNamingConventionOfRides < ActiveRecord::Migration
	def change
		change_table :rides do |t|
			t.rename :RideName, :name
			t.remove :RideSponsorId
			t.rename :RideDate, :date
			t.rename :RideLaunchTime, :launch_time
			t.rename :RideTerrain, :terrain
			t.remove :RideLeader
			t.belongs_to :rider, index: true
			t.rename :Description, :description
		end
	end
end
