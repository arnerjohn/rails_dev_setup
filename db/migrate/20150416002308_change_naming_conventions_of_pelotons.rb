class ChangeNamingConventionsOfPelotons < ActiveRecord::Migration
  def change
		change_table :pelotons do |t|
			t.rename :PelName, :name
			t.remove :PelCaptainId
			t.belongs_to :rider, index: true
			t.rename :PelWeb, :website_url
		end
  end
end
