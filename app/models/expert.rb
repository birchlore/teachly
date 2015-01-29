class Expert < ActiveRecord::Base
	# Allows skills to be stored as an array
	serialize :skills
	
	has_attached_file :avatar, styles: { profile: "200x200>"}
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	has_many :reviews

	def name
		return nil unless has_full_name?
		first_name.capitalize << " " << last_name[0].capitalize << "."
	end
	
	def has_full_name?
		!first_name.nil? && !last_name.nil?
	end
end
