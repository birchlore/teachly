# Homepage (Root path)
get '/' do
  erb :index
end

get '/search/experts' do
	@experts = []
	@terms = Search.find(session[:search_id]).terms.map(&:downcase)
	Expert.find_each do |expert|
		@experts << expert if (expert.skills & @terms).any?
	end
	@experts.sort!{ |e1,e2| e2.plebian_score <=> e1.plebian_score }
	erb :search_results
end

post '/search' do
	search_terms = params[:search].split(' ')
	search = Search.create(terms: search_terms)
	session[:search_id] = search.id 
	
	redirect '/search/experts'
end

get '/dashboard' do
  erb :dashboard
end

get '/expert/:id' do
  @expert = Expert.find(params[:id])
  @reviews = @expert.reviews
  erb :public_profile
end

get '/dashboard/edit' do
  erb :edit_profile
end

