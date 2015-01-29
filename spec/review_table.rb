require './spec_helper'

describe Review  do

  before :each do

    @review = Review.new "Matt G.","I love this app",1.0

  end
  
  describe "#new" do
    it "takes in three parameters and returns a Review object" do
      @expert.should be_an_instance_of Review
    end
  end

  describe "#save" do
    it "saves new instance of Review to db" do
      expect(@expert.save).to be_true
    end
  end
  
end