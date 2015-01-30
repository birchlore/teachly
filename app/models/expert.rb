class Expert < ActiveRecord::Base
	has_many :reviews

	validates :first_name, :last_name, presence: true
	# Allows skills to be stored as an array
	serialize :skills
	
	mount_uploader :avatar, AvatarUploader
	after_create :update_rank


	def name
		return nil unless has_full_name?
		first_name.capitalize << " " << last_name[0].capitalize << "."
	end
	
	#can be replaced by validation?
	def has_full_name?
		!first_name.nil? && !last_name.nil?
	end

	def update_rating
		# Why does this work without self but without it doesn't
		return self.rating = nil if reviews.length < 1
		self.rating = reviews.inject(0) { |sum, review| sum + review.rating }.to_f / reviews.length 
		save
	end

	def update_rank
		self.plebian_score =	Stats::PlebianScore.run(rating, reviews, created_at)	
		save
	end

end
