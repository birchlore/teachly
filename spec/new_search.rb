require './spec_helper'

describe Search do 

  before :each do
    @search = Search.new(terms: "Quickbooks")
  end

  describe "#terms" do
    it "must have at least one parameter" do
      @search.terms = nil
      expect{@search.save!}.to raise_error
    end
  end

  describe "#error_msg" do
    it "returns the custom error msg" do
      @search.terms = nil
      @search.save
      expect(@search.errors[:terms]).to eq (["Please enter a search term"])
    end    
  end
  
end