require_relative '../config/environment.rb'
Expert.delete_all
Search.delete_all

skill1 = ["quickbooks", "xero", "excel"]
skill2 = ["quickbooks", "google analytics", "hootsuite", "excel"]
skill3 = ["hootsuite", "excel", "xero"]
skill4 = ["facebook ads", "google ppc", "hootsuite", "excel"]
skill5 = ["photoshop","illustrator","fireworks", "excel"]
skill6 = ["photoshop", "quickbooks", "xero", "excel"]
skill7 = ["ruby on rails", "python", "heroku", "excel"]
skill8 = ["shopify", "google analytics", "hootsuite", "excel"]
skill9 = ["quickbooks", "photoshop", "google analytics", "excel"]

skillsets = [skill1, skill2, skill3, skill4, skill5, skill6, skill7, skill8, skill9]


### 80% of people will give a good rating

def give_rating
  num = rand(10)
  if num <= 2
    rating = 0
  else
    rating = 1
  end
end

pictures = File.open(APP_ROOT.join('db/pictures/pictures.txt'))

100.times do
	avatar_path = APP_ROOT.join('db/pictures/', pictures.readline.chomp)
  expert = Expert.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, hourly_rate: rand(20..40).floor, skills: skillsets.sample, bio: Faker::Lorem.paragraph(sentence_count=8), email: Faker::Internet.email, password: Faker::Internet.password, avatar: File.open(avatar_path))
  10.times do
    expert.reviews.create(name: Faker::Name.name, content: Faker::Lorem.paragraph, rating: give_rating)
  end
end


## Hypothesis

### 1. adding Shopify as a popular software BUT most expert skillsets do NOT include it
### therefore we are hypothesizing that the algorithm should show this as a highly needed skill

### 2. Even though not many people are searching for 'amazon', no experts skillsets include it, so it should
### appear very high on the list

### 3. Even though excel is highly searched, every skillset includes it so it should not appear on our list




### 80% of people will search for a popular software

def search_term
  popular_software = ["quickbooks","xero","excel","google analytics", "photoshop", "shopify"] 
  fringe_software = ["illustrator", "fireworks",  "heroku", "python", "ruby on rails", "hootsuite", "amazon", "google ppc", "facebook ads"]

  num = rand(10)
  if num <= 2
    fringe_software.sample
  else
    popular_software.sample
  end
end


100.times do
  Search.create(terms: [search_term])
end


