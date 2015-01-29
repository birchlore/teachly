class AddAvatarToExperts < ActiveRecord::Migration
  def change
		add_column :experts, :avatar, :string
  end
end
