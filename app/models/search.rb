class Search < ActiveRecord::Base
extend ActiveModel::Naming

  validate :error_msg

  def error_msg
    @errors.add(:terms, "Please enter a search term") if terms.nil?
  end
end
