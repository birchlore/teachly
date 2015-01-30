require '../config/environment'

Expert.delete_all

skill1 = ["quickbooks", "xero", "excel"]
skill2 = ["quickbooks", "google analytics", "hootsuite"]
skill3 = ["hootsuite", "excel", "xero"]
skill4 = ["facebook ads", "google ppc", "hootsuite"]
skill5 = ["photoshop","illustrator","fireworks"]
skill6 = ["photoshop", "quickbooks", "xero"]
skill7 = ["ruby on rails", "python", "heroku"]
skill8 = ["shopify", "google analytics", "amazon"]
skill9 = ["quickbooks", "shopify", "google analytics"]

skillsets = [skill1, skill2, skill3, skill4, skill5, skill6, skill7, skill8, skill9]

def give_rating
  num = rand(10)
  if num <= 2
    rating = 0
  else
    rating = 1
  end
end


100.times do |i|
  expert = Expert.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, hourly_rate: rand(20..40).floor, skills: skillsets.sample, bio: Faker::Lorem.paragraph, email: Faker::Internet.email, password: Faker::Internet.password)
  5.times do |j|
    expert.reviews.create(name: Faker::Name.name, content: Faker::Lorem.paragraph, rating: give_rating)
  end
end