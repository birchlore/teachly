class Review < ActiveRecord::Base
	belongs_to :expert
  
  validates :rating, inclusion: { in: [0,1] }
  validates :name,:content, presence: true
  	
	after_create :update_experts_rating

	private

	def update_experts_rating
		expert.update_rating
		expert.update_rank
  end

end
