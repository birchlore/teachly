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

	def update_rating
		return nil if reviews.length < 1
		reviews.inject(0) { |sum, review| sum + review.rating}.to_f / reviews.length 
	end

end
