# Homepage (Root path)
get '/' do
  erb :index
end

post '/search' do
  erb :search_results
end

get '/dashboard' do
  erb :dashboard
end

get '/expert/:id' do
  erb :public_profile
end

