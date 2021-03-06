class UsersController < ApplicationController
	before_filter :authenticate, :only => [:index, :edit, :update, :destroy, :business_index]
	before_filter :correct_user, :only => [:edit, :update]  
	before_filter :admin_user,   :only => :destroy
 
 	def index
 		@title = "All users"
 		@users = User.paginate(:page => params[:page])
 	end
 	
 	def business_index
 		@title = "All businesses"
 		@users = User.businesses
 		render 'business_index'
 	end
 	
  def show
    @user = User.find(params[:id])
    @commercials = @user.commercials
    @posts = @user.posts.recent
    @title = @user.name
  end  
  
  def new
    @user = User.new
    @title = "Sign up"
    @business = false
  end
  
  def business_new
  	@user = User.new
  	@title = "Business sign up"
  	@business = true
  	render 'new'
  end

  def create
    @user = User.new(params[:user])
    @business = @user.business_user
    logger.debug "Value of @business #{@business}"
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Commercialize!"
      redirect_to root_path
    else
			@title = "Sign up"
    	@title = "Business sign up" if @business
			render 'new'
    end
  end

	def edit
		@title = "Edit user"
	end
	
	def update
		if @user.update_attributes(params[:user])
			flash[:success] = "Profile updated."
			redirect_to @user
		else
			@title = "Edit user"
			render 'edit'
		end
	end
	
	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User destroyed."
		redirect_to users_path
	end
  
  private
  	
  	def correct_user
  		@user = User.find(params[:id])
  		redirect_to(root_path) unless current_user?(@user)
  	end
  	
  	def admin_user
  		redirect_to(root_path) unless current_user.admin?
  	end
  		
end
