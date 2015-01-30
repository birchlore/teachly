class Review < ActiveRecord::Base
	belongs_to :expert
  validates :name,:content, presence: true
  validates :rating, inclusion: { in: [0,1] }
  #need a callback for notifcation to expert?
end
