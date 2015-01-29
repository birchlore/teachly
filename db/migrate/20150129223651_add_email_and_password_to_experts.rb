class AddEmailAndPasswordToExperts < ActiveRecord::Migration
  def change
		add_column :experts, :email, :string
		add_column :experts, :password, :string
  end
end
