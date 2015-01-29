require 'spec_helper'

describe Review do 

  before :each do
    @search = Search.new "Quickbooks"
  end

  describe "#new" do
    it "takes in a parameter and returns a Search object" do
      @search should_be_an_instance of Search
    end
    it "must have at least one parameter" do
      @search.term = nil
      expect(@search.term).to raise_error
    end 
    
  end
  
end