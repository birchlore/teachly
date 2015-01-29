class Expert < ActiveRecord::Base
	has_many :reviews
	# Allows skills to be stored as an array
	serialize :skills
	
	mount_uploader :avatar, AvatarUploader


	def name
		return nil unless has_full_name?
		first_name.capitalize << " " << last_name[0].capitalize << "."
	end
	
	def has_full_name?
		!first_name.nil? && !last_name.nil?
	end
end
