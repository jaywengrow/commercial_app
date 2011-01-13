class PagesController < ApplicationController
  def home
    @title = "Welcome to Commercial.ize!"
    if signed_in?
    	if current_user.business_user? && current_user.commercials.empty?
    		render 'introduction' 		
    	elsif !current_user.business_user?
    		render 'poster_home'
    	else #business user with commercials
    		redirect_to user_path(current_user)
    	end
    end	
  end

  def contact
    @title = "Contact us!"
  end

  def about
    @title = "About us!"
  end
  
  def edit
  	redirect_to user_path(current_user)
  end

end
