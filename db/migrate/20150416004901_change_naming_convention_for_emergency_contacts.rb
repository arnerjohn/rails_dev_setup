class ChangeNamingConventionForEmergencyContacts < ActiveRecord::Migration
  def change
		change_table :emergency_contacts do |t|
			t.remove :RideID
			t.belongs_to :rider, index: true
			t.rename :Name, :full_name
			t.remove :Phone
			t.string :phone
			t.rename :Relationship, :relationship
		end
  end
end
