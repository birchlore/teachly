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
  @expert = Expert.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, hourly_rate: rand(20..40).floor, skills: ["quickbooks", "photoshop", "google analytics", "excel"], bio: Faker::Lorem.paragraph(sentence_count=8), email: Faker::Internet.email, password: Faker::Internet.password)
  erb :public_profile
end

