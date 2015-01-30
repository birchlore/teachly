require './spec_helper'

describe Review  do

  before :each do

    @review = Review.new name: "Matt G",content:"I love this app"

  end

  describe "associations" do
    it "should be able to reach its expert" do
    expect{@review.expert}.not_to raise_error
    end
  end
  
  describe "#name" do
    it "is required" do
      @review.name = nil
      expect(@review).to_not be_valid
      expect(@review.errors[:name]).to eq (["can't be blank"])
    end
  end

  describe "#content" do
    it "is required" do
      @review.content = nil
      expect(@review).to_not be_valid
      expect(@review.errors[:content]).to eq(["can't be blank"])
    end
  end

  describe "#rating" do
    it "must have the set [0,1]" do
      @review.rating = [2,5]
      expect(@review).to_not be_valid
      expect(@review.errors[:rating]).to eq(["is not included in the list"])
    end
  end

  describe "#update_experts_rating" do
    it "updates experts rating" do
      @expert = Expert.new(first_name: "Matt", last_name: "Gradidge", hourly_rate: 12.00, rating: 0.0, skills:  "LHL TA")
      @review.expert = @expert
      expect(@review).to receive(:update_experts_rating) 
      @review.run_callbacks(:create)
    end
  end
end
