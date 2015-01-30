class Expert < ActiveRecord::Base
	# Allows skills to be stored as an array
	serialize :skills
	
	mount_uploader :avatar, AvatarUploader

	has_many :reviews

	def name
		return nil unless has_full_name?
		first_name.capitalize << " " << last_name[0].capitalize << "."
	end
	
	def has_full_name?
		!first_name.nil? && !last_name.nil?
	end

	def update_rating
		# Why does this work without self but without it doesn't
		return self.rating = nil if reviews.length < 1
		self.rating = reviews.inject(0) { |sum, review| sum + review.rating }.to_f / reviews.length 
		save
	end

end
