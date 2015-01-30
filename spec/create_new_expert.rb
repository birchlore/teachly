require './spec_helper'

describe Expert do
  
  before :each do 
    @expert = Expert.new(first_name: "Matt", last_name: "Gradidge", hourly_rate: 12.00, rating: 0.0, skills:  "LHL TA")
  end 

  describe "#password"
    it "password must be 6 characters long" do
      @expert.password = 1234
      expect(@expert.password).to raise_error "Password must be at least 6 charaters long"
    end

    it "password entered must match the one stored with the expert" do
      @expert.password = 457896
      expect(@expert.password).to be_false
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
end
