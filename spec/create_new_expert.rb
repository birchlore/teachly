
require 'spec_helper'

describe Expert do
  
  before :each do 
    @expert = Expert.new "Matt","Gradidge",123456, :rate 
  end 
  
  describe '#new' do
    it "takes in two parameters and returns a Expert object" do
      @expert.should be_an_instance_of Expert
    end
  end 

  describe '#save' do
    it "saves new instance of Expert to db" do
      expect(@expert.save).to be_true
    end

  describe "has no rate yet" do
    expect(@expert.rate).to eq(0)
  end

  describe "can only have a max rate of 100%" do
    @expert.rate = 1.2
    expect(@expert.rate).to raise_error
    expect(@expert.rate).to eq(1.0)
  end

  describe  ".name returns first_name and first letter of last_name" do
    expect(@expert.name).to eq("Matt G")
  end    

  describe "password must be 6 characters long" do
    @expert.password = 1234
    expect(@expert.password).to raise_error "Password must be at least 6 charaters long"
  end

  describe "password entered must match the one stored with the expert" do
    @expert.password = 457896
    expect(@expert.password).to be_false

end