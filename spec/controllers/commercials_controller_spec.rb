require 'spec_helper'

describe CommercialsController do
	render_views

  describe "GET 'index'" do
  
  	before(:each) do	
			@user = test_sign_in(Factory(:user))
			@user.toggle!(:business_user)
		end

    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
#    it "should be successful" do
#      get 'show'
#      response.should be_success
#    end
  end

  describe "GET 'new'" do
    before(:each) do	
			@user = test_sign_in(Factory(:user))
			@user.toggle!(:business_user)
		end
		
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should deny non-business users" do
    	@user.toggle!(:business_user)
    	get :new
    	response.should_not be_success
    end
  end

  describe "POST 'create'" do
    before(:each) do	
			@user = test_sign_in(Factory(:user))
			@user.toggle!(:business_user)
		end
    
    it "should be successful" do
      get 'create'
      response.should be_success
    end
    
    describe "failure" do
    
    	before(:each) do
    		@attr = { :transcript => " " , :title => "some title"}
    	end
    	
    	it "should not create a commercial" do
    		lambda do
    			post :create, :commercial => @attr
    		end.should_not change(Commercial, :count)
    	end
    	
    	#it "should render the home page" do
    	#	post :create, :commercial => @attr
    	#	response.should render_template('pages/home')
    	#end
    end
    
    describe "success" do
    
    	before(:each) do
    		@attr = { :transcript => "Here's a transcript" , :title => "some title"}
    	end
    	
    	it "should create a commercial" do
    		lambda do
    			post :create, :commercial => @attr
    		end.should change(Commercial, :count).by(1)
    	end
    	
    	it "should have a flash message" do
    		post :create, :commercial => @attr
    		flash[:success].should =~ /created/i
    	end
    end 
  end

  describe "GET 'edit'" do
#    it "should be successful" do
#      get 'edit'
#      response.should be_success
#    end
  end

  describe "GET 'update'" do
#    it "should be successful" do
#      get 'update'
#      response.should be_success
#    end
  end

  describe "DELETE 'destroy'" do
#    it "should be successful" do
#      delete 'destroy'
#      response.should be_success
#    end
  end
  
  describe "access control" do
  
  	it "should deny access to 'create' if not signed in" do
  		post :create
  		response.should redirect_to(signin_path)
  	end
  	
  	it "should deny access to 'destroy' if not signed in" do
  		post :create
  		response.should redirect_to(signin_path)
  	end
  	
  end

end
