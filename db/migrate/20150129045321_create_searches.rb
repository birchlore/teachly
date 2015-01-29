class CreateSearches < ActiveRecord::Migration
  def up
		create_table :searches do |t|
			t.string :terms
			t.timestamps	
		end
  end

	def down
	end
end
