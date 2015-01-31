require_relative '../config/environment.rb'

class UpdateStats
	
	class << self

		def run
		end

		def search_count
			search_hash = Hash.new(0)
			expert_hash = Hash.new(0)
			recent_searches = Search.where("created_at >= ?", 7.days.ago) 
			recent_searches.each do |search|
				search.terms.each do |term|
					insert_hash = search_hash[term.to_sym]
				 	insert_hash.nil? ? insert_hash += 1 : insert_hash = 1		
				end
			end
			binding.pry
		end

	end
end
