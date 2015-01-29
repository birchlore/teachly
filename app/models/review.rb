class Review < ActiveRecord::Base
	validates :rating, inclusion: { in: [1,2] }
	
	belongs_to :expert
end
