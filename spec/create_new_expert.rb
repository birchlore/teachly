require './spec_helper'

describe Expert do
  
  before :each do 
    @expert = Expert.new(first_name: "Matt", last_name: "Gradidge", hourly_rate: 12.00, rating: 0.0, skills:  "LHL TA")
  end 

  describe "association" do
    it "expert can retrive all its reviews " do
      expect{@expert.reviews}.not_to raise_error
    end 
  end

  describe "#password"
    it "password must be at least 6 characters long" do
      @expert.password = 1234
      @expert.save
      expect(@expert.errors[:password]).to eq (["is too short (minimum is 6 characters)"])
    end

    it "password must be no more than 10 characters" do
      @expert.password = 55555554848894457896
      @expert.save
      expect(@expert.errors[:password]).to eq (["is too long (maximum is 10 characters)"])
  	end
  end
  
  describe "#rating" do
    it "has no rate yet" do
      expect(@expert.rate).to eq(0)
    end

    it "can only have a max rating of 100%" do
      @expert.rating = 1.2
      expect(@expert.rating).to raise_error
      expect(@expert.rating).to eq(1.0)
    end
  end

  describe "#first_name" do
    it "should be present" do
      @expert.first_name = nil
      expect(@first_name).to be_false
    end
  end

  describe "#last_name" do
    it "should be present" do
      @expert.last_name = nil
      expect(@last_name).to be_false
    end
  end

  describe ".name" do
    it  "returns first_name and first letter of last_name" do
      expect(@expert.name).to eq("Matt G.")
    end
  end
