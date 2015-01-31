class DropSearchStatsCreateRankings < ActiveRecord::Migration
  def change
		drop_table :search_stats

		create_table :rankings do |t|
			t.string :term
			t.float  :ratio
			t.timestamps
		end
  end
end
