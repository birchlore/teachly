class AddAvatarToExperts < ActiveRecord::Migration
  def change
		add_column :experts, :avatar_file_name, :string
		add_column :experts, :avatar_content_type, :string
		add_column :experts, :avatar_file_size, :integer
		add_column :experts, :avatar_updated_at, :datetime
  end
end
