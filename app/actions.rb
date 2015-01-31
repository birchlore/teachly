# Homepage (Root path)
get '/' do
  erb :index
end

get '/search/experts' do
	@experts = []
	terms = Search.find(session[:search_id]).terms
	Expert.find_each do |expert|
		@experts << expert if (expert.skills & terms).any?
	end
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
  erb :public_profile
end

