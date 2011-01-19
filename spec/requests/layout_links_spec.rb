require 'spec_helper'

  describe "LayoutLinks" do
  
  
    it "should have a Home page at '/'" do
      get '/'
      response.should have_selector('title', :content => "Welcome")
    end

    it "should have a Contact page at '/contact'" do
      get '/contact'
      response.should have_selector('title', :content => "Contact")
    end

    it "should have an About page at '/about'" do
      get '/about'
      response.should have_selector('title', :content => "About")
    end

    describe "when not signed in" do
		
			it "should have a signin link" do
				visit root_path
				response.should have_selector("a", :href => signin_path,
																			:content => "Sign in")
			end
		end

		describe "when signed in" do
			before(:each) do
				@user = Factory(:user)
					visit signin_path
					fill_in :email, :with => @user.email
					fill_in :password, :with => @user.password
					click_button "Sign in"
			end

			it "should have a signout link" do
				visit root_path
				response.should have_selector("a", :href => signout_path,
																			:content => "Sign out")
			end

			it "should have a profile link" do
				visit root_path
				response.should have_selector("a", :href => user_path(@user),
																					 :content => "Profile")
			end
		end

		describe "sign in/out" do

			describe "failure" do

				it "should not sign a user in" do
					visit signin_path
					fill_in :email, :with => ""
					fill_in :password, :with => ""
					click_button "Sign in"
					response.should have_selector("div.flash.error", :content => "Invalid")
				end
			end

			describe "success" do

				it "should sign a user in and out" do
					user = Factory(:user)
					visit signin_path
					fill_in :email, :with => user.email
					fill_in :password, :with => user.password
					click_button "Sign in"
					controller.should be_signed_in
					click_link "Sign out"
					controller.should_not be_signed_in
				end
			end

  end
end

