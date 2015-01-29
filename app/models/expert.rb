class Expert < ActiveRecord::Base
	# Allows skills to be stored as an array
	serialize :skills

	def name
		first_name.capitalize << " " << last_name[0].capitalize << "."
	end
end
