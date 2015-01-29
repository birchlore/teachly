require './spec_helper'

describe Expert do
  
  before :each do 
    @expert = Expert.new(first_name: "Matt", last_name: "Gradidge", hourly_rate: 12.00, rating: 0, skills:  "LHL TA")
  end 
  
  describe '#new' do
    it "takes in 5 parameters and returns a Expert object" do
      @expert.should be_an_instance_of Expert
    end
  end 

  describe '#save' do
    it "saves new instance of Expert to db" do
      expect(@expert.save).to be_true
    end
	end

  it "has no rate yet" do
    expect(@expert.rate).to eq(0)
  end

  it "can only have a max rating of 100%" do
    @expert.rating = 1.2
    expect(@expert.rate).to raise_error
    expect(@expert.rate).to eq(1.0)
  end

  it  ".name returns first_name and first letter of last_name" do
    expect(@expert.name).to eq("Matt G.")
  end    

  it "password must be 6 characters long" do
    @expert.password = 1234
    expect(@expert.password).to raise_error "Password must be at least 6 charaters long"
  end

  it "password entered must match the one stored with the expert" do
    @expert.password = 457896
    expect(@expert.password).to be_false
	end

end
