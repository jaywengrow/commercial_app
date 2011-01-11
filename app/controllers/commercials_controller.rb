class CommercialsController < ApplicationController
	before_filter :authenticate
	before_filter :business_filter, :except => [:index, :show]
	before_filter :correct_user, :only => [:edit, :update, :destroy]
	
  def index
  	@commercials = Commercial.all
  	@title = "All the commercials!"
  end

  def show
  	@commercial = Commercial.find(params[:id])
  	@show = true # lets commercial partial in view know it's coming from show action
  	@posts = @commercial.posts
  	title = "Commercial transcript from #{@commercial.user.name}"
  end

  def new
  	@title = "Post a new commercial transcipt!"
  	@commercial = Commercial.new
  end

  def create
  	@commercial = current_user.commercials.build(params[:commercial])
  	if @commercial.save
  		flash[:success] = "Commercial created!"
  		redirect_to user_path(current_user)
  	else
  		flash[:error] = "Commercial not created."
  		render 'new'
  	end
  end

  def edit
    @commercial = Commercial.find(params[:id])
  	@title = "Edit commercial transcript"
  end

  def update
  	@commercial = Commercial.find(params[:id])
  	if @commercial.update_attributes(params[:commercial])
  		flash[:success] = "Commercial updated!"
  		redirect_to user_path(current_user)
  	else
  		flash[:error] = "Commercial not created."
  		render 'edit'
  	end
  end

  def destroy
  	Commercial.find(params[:id]).destroy
		flash[:success] = "Commercial destroyed."
		redirect_to user_path(current_user)
  end
  
  private
  	
  	def correct_user
  		@user = Commercial.find(params[:id]).user
  		redirect_to(root_path) unless current_user?(@user)
		end
end
