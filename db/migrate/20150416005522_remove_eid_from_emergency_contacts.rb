class RemoveEidFromEmergencyContacts < ActiveRecord::Migration
  def change
    remove_column :emergency_contacts, :EID
  end
end
