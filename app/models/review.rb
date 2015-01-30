class Review < ActiveRecord::Base
	validates :rating, inclusion: { in: [0,1] }
	
	belongs_to :expert
	
	after_create :update_experts_rating

	private
		def update_experts_rating
			expert.update_rating
		end
end
