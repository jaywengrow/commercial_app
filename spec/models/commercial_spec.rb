require 'spec_helper'

describe Commercial do
  
  before(:each) do
  	@user = Factory(:user)
  	@attr = { :transcript => "some content" }
  end
  
	it "should create a new instance given valid attributes" do
		@user.commercials.create!(@attr)
	end

	describe "validations" do
	
		it "should not be blank" do
			blank_commercial = @user.commercials.build("    ")
			blank_commercial.should_not be_valid
		end
		
		it "should require a user id" do
			Commercial.new(@attr).should_not be_valid
		end
	end
	
	describe "user associations" do
	
	  before(:each) do
	  	@commercial = @user.commercials.create(@attr)
	  end
	  
	  it "should respond to Users" do
  		@commercial.should respond_to(:user)
  	end
  	
  	it "should have the right associated user" do
  		@commercial.user_id.should == @user.id
  		@commercial.user.should == @user
  	end
  end	
end
