class PostsController < ApplicationController
	before_filter :authenticate
	before_filter :non_business_filter, :except => [:edit, :update, :destroy]
	before_filter :correct_user, :only => [:edit, :update, :destroy]
	
	def new
		@title = "Post video"
		@post = Post.new
		@commercial = Commercial.find(params[:commercial_id])
	end

	def create
		@post = current_user.posts.build(params[:post])
		@commercial = @post.commercial
  	if @post.save
  		flash[:success] = "Post created for commercial #{@post.commercial_id}!"
  		redirect_to commercial_path(@post.commercial)
  	else
  		flash[:error] = "Post not created."
  		render 'new'
  	end
	end
	
	def edit
		render 'edit'
	end
	
	def update
		if @post.update_attributes(params[:post])
			flash[:success] = "Post successfully edited!"
			redirect_to commercial_path(@post.commercial)
		else
			flash[:error] = "Post has not changed."
			render 'edit'
		end
	end
	
	def destroy
		@post.destroy
		flash[:success] = "Post destroyed."
		redirect_to commercial_path(@commercial)
	end
	
	private
  	
  	def correct_user
  		@post = Post.find(params[:id])
  		@commercial = @post.commercial
  		@user = Post.find(params[:id]).user
  		#logger.debug "howdy howdy howdy #{@post} #{@commercial} #{commercial.user}"
  		redirect_to(root_path) unless current_user?(@user) || current_user?(@commercial.user)
		end
end
