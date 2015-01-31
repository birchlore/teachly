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
  	@rankings = Ranking.order('ratio DESC').limit(5)
  erb :dashboard
end

get '/expert/:id' do
  @expert = Expert.find(params[:id])
  @reviews = @expert.reviews
  erb :public_profile
end

get '/dashboard/edit' do
  unless session[:expert_id] == nil
    @expert = Expert.find(session[:expert_id])
  end
  erb :edit_profile
end

post '/dashboard/edit' do
  expert = Expert.create(first_name: params[:first_name], last_name: params[:last_name], password: params[:password], bio: params[:bio], skills: params[:skills].split(","), hourly_rate: params[:hourly_rate], avatar: params[:avatar])
  session[:expert_id] = expert.id

  redirect '/dashboard/edit'
end


get '/logout' do
  session[:expert_id] = nil
  erb :index
end

