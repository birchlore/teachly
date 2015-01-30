require 'date'

module Stats

	class PlebianScore

		class << self

			def wilson_score_interval(positives, n)
					return 0 if n == 0
					confidence = 0.95
					z = Statistics2.pnormaldist(1-(1-confidence)/2)
					p_hat = 1.0*positives/n
					(p_hat + (z**2) / (2*n) - z * Math.sqrt((p_hat * (1-p_hat) +z**2 / (4*n)) / n)) / (1 + z**2 / n )
			end

			def new_user(user_date)
				# Returns 1 for new user or 0 for none
				(Date.today - user_date) < 7 ? 1 : 0 			
			end

			def run(rating, reviews, user_date)
				review_count = reviews.count
				pos_reviews = rating.to_f * review_count
				wilson_score_interval(pos_reviews, review_count)*70 + new_user(user_date.to_date)*20 + Random::rand(1.0)*10 	
			end

		end
	end
end

