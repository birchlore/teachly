class CreateExpert < ActiveRecord::Migration
  def change
		create_table :experts do |t|
			t.string 	:first_name
			t.string 	:last_name
			t.decimal :hourly_rate
			t.decimal :rating
			t.text		:skills
			t.timestamps
		end
  end

	
end
