class AddPlebianScoreColumnToExperts < ActiveRecord::Migration
  def change
		add_column :experts, :plebian_score, :float
  end
end
