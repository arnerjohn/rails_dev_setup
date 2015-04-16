class ChangeNamingConventionOfRiders < ActiveRecord::Migration
  change_table :riders do |t|
		t.rename :Name, :name
		t.rename :Age, :age
		t.rename :Addr1, :address_1
		t.rename :Addr2, :address_2
		t.rename :City, :city
		t.rename :State, :state
		t.rename :Zip, :zip_code
		t.rename :Region, :region
		t.rename :Email, :email
		t.rename :Phone, :phone
		t.remove :Password
  end
end
