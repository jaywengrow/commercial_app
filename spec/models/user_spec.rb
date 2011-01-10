require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :name                  => "Example User",
              :email                 => "user@example.com",
              :password              => "password",
              :password_confirmation => "password" }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end

  
  describe "validations" do
  
    it "name should not be blank" do
      user = User.new(@attr.merge(:name => " "))
      user.should_not be_valid  
    end

    it "email should not be blank" do
      user = User.new(@attr.merge(:email => " "))
      user.should_not be_valid
    end
    
    it "should reject names that are too long" do
      long_name = "z" * 41
      long_name_user = User.new(@attr.merge(:name => long_name))
      long_name_user.should_not be_valid
    end

    it "should accept valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email_user = User.new(@attr.merge(:email => address))
        valid_email_user.should be_valid
      end
    end
  
    it "should reject invalid email addresses" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        invalid_email_user = User.new(@attr.merge(:email => address))
        invalid_email_user.should_not be_valid
      end
    end

    it "should reject duplicate email addresses" do
      user1 = User.create(@attr)
      user2 = User.create(@attr.merge(:name => "Johnnyo"))
      user2.should_not be_valid
    end
    
    it "should reject email addresses identical up to case" do
      upcased_email = @attr[:email].upcase
      user1 = User.create(@attr.merge(:email => upcased_email))
      user2 = User.create(@attr)
      user2.should_not be_valid
    end
  
    it "should require a password" do
      User.new(@attr.merge(:password => " ", :password_confirmation => " ")).
        should_not be_valid
    end
    
    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "123456")).
        should_not be_valid
    end
    
    it "should reject passwords under 6 characters" do
      User.new(@attr.merge(:password => "qwert",
                           :password_confirmation => "qwert")).
        should_not be_valid
    end
    
    it "should reject passwords above 40 characters" do
      long_password = "q" * 41
      User.new(@attr.merge(:password => long_password,
                           :pasword_confirmation => long_password)).
        should_not be_valid
    end
  end 
  
  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end
  

    it "should set the encrypted password" do
      @user.encrypted_password.should_not be_blank
    end
  end
  
  describe "password encryption" do
  
    before(:each) do
      @user = User.create!(@attr)
    end
    
    describe "has_correct_password? method" do
    
      it "should be true if the passwords match" do
        @user.has_correct_password?(@attr[:password]).should be_true
      end
      
      it "should be false if passwords don't match" do
        @user.has_correct_password?("justplainwrong").should be_false
      end
    end
  end
  
  describe "authenticate method" do

    it "should return nil on email/password mismatch" do
      wrong_password_user = User.authenticate(@attr[:email], "wrongpass")
      wrong_password_user.should be_nil
    end
    
    it "should return nil for an email address with no user" do
      nonexistent_user = User.authenticate("bar@foo.com", @attr[:password])
      nonexistent_user.should be_nil
    end

    it "should return the user on email/password match" do
      matching_user = User.authenticate(@attr[:email], @attr[:password])
      matching_user.should == @user
    end
  end
  
  describe "admin attribute" do
  
  	before(:each) do
  		@user = User.create!(@attr)
  	end
  	
  	it "should respond to admin" do
  		@user.should respond_to(:admin)
  	end
  	
  	it "should not be an admin by default" do
  		@user.should_not be_admin
  	end
  	
  	it "should be convertible to an admin" do
  		@user.toggle!(:admin)
  		@user.should be_admin
  	end
  end
  
  describe "business_user attribute" do
  
  	before(:each) do
  		@user = User.create!(@attr)
  	end
  	
  	it "should respond to business_user" do
  		@user.should respond_to(:business_user)
  	end
  	
  	it "should not be an business_user by default" do
  		@user.should_not be_business_user
  	end
  	
  	it "should be convertible to an business_user" do
  		@user.toggle!(:business_user)
  		@user.should be_business_user
  	end
  end
  
  describe "commercial associations" do
    	
    before(:each) do
  		@user = User.create!(@attr)
			@com1 = Factory(:commercial, :user => @user, :created_at => 1.day.ago)
			@com2 = Factory(:commercial, :user => @user, :created_at => 1.hour.ago)
  	end
  
  	it "should respond to commercials" do
  		@user.should respond_to(:commercials)
  	end
  	
  	it "should have commercials created in order starting from most recent" do
			@user.commercials.should == [@com2, @com1]
		end
	
		it "should destroy associated commercials" do
			@user.destroy
			[@com1, @com2].each do |commercial|
				Commercial.find_by_id(commercial.id).should be_nil
			end
		end
  end
end

