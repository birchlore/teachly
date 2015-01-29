class AddExpertIdToReviews < ActiveRecord::Migration
  def change
		add_reference :reviews, :expert, index: true
  end
end
