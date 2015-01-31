class ChangeTermToTermsForSearch < ActiveRecord::Migration
  def change
		change_column :searches, :terms, :text 
  end
end
