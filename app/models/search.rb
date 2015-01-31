class Search < ActiveRecord::Base
extend ActiveModel::Naming

	serialize :terms
  validate :error_msg

  def error_msg
    @errors.add(:terms, "Please enter a search term") if terms.empty?
  end
end
