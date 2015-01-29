# Homepage (Root path)
get '/' do
  erb :index
end

get '/user/expert/' do
  erb :results
end
