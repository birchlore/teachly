class Expert < ActiveRecord::Base
	has_many :reviews

	validates :first_name, :last_name, presence: true
	validates :password,length:{ minimum: 6,maximum: 10 }
	# Allows skills to be stored as an array
	serialize :skills
	
	mount_uploader :avatar, AvatarUploader
	after_create :update_rank
	after_create :default_profile_photo


	def name
		first_name.capitalize << " " << last_name[0].capitalize << "."
	end
	
		def update_rating
		# Why does this work without self but without it doesn't
		#that sentance makes no sense-N
		return self.rating = nil if reviews.length < 1
		self.rating = reviews.inject(0) { |sum, review| sum + review.rating }.to_f / reviews.length 
		save
	end

	def update_rank
		self.plebian_score =	Stats::PlebianScore.run(rating, reviews, created_at)	
		save
	end

	def default_profile_photo
		unless avatar
			self.avatar = "http://placehold.it/400x400"
		end
	end

end
