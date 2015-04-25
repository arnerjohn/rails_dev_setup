class CreateParticipationsTable < ActiveRecord::Migration
  def change
    create_table :ride_participations do |t|
			t.belongs_to :rider, index: true
			t.belongs_to :ride, index: true
			t.string :role
			t.timestamps null: false
    end
  end
end
