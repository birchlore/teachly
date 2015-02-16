require_relative '../config/environment.rb'

class UpdateStats
	
	class << self

		def run
			Ranking.destroy_all
			search_hash = Hash.new(0)
			expert_hash = Hash.new(0)
			recent_searches = Search.where("created_at >= ?", 7.days.ago) 

			recent_searches.each do |search|
				search.terms.each do |term|
					search_hash[term.to_sym] == 0 ? search_hash[term.to_sym] = 1 : search_hash[term.to_sym] += 1		
				end
			end

			Expert.find_each do |expert|
				expert.skills.each do |skill|
					expert_hash[skill.to_sym] == 0 ? expert_hash[skill.to_sym] = 1 : expert_hash[skill.to_sym] += 1
				end
			end


		search_hash.each do |key,value|
			Ranking.create(term: key,ratio: calculate_ratio(search_hash[key],expert_hash[key])) 
		end

		end

		def calculate_ratio(search_count, skill_count)
			skill_count.to_i == 0 ? 0 : search_count.to_f/skill_count
		end

	end
end

UpdateStats.run
