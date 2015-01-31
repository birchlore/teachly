class CreateSearchStats < ActiveRecord::Migration
  def up
		create_table :search_stats do |t|
			t.string :term
			t.float  :ratio
			t.timestamps
		end
  end

	def down
		drop_table :search_stats
	end
end
