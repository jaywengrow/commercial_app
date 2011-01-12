class PostsController < ApplicationController
	before_filter :authenticate
	before_filter :non_business_filter
	before_filter :correct_user, :only => [:edit, :update, :destroy]
	
	def new
		@title = "Post video"
		@post = Post.new
		@commercial = Commercial.find(params[:commercial_id])
	end

	def create
		@post = current_user.posts.build(params[:post])
  	if @post.save
  		flash[:success] = "Post created for commercial #{@post.commercial_id}!"
  		redirect_to commercial_path(@post.commercial)
  	else
  		flash[:error] = "Post not created."
  		render 'new'
  	end
	end
	
	def edit
		@post = Post.find(params[:id])
		@commercial = @post.commercial
		render 'edit'
	end
	
	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
			flash[:success] = "Post successfully edited!"
			redirect_to commercial_path(@post.commercial)
		else
			flash[:error] = "Post has not changed."
			render 'edit'
		end
	end
	
	def destroy
	  Post.find(params[:id]).destroy
		flash[:success] = "Post destroyed."
		redirect_to user_path(current_user)
	end
	
	private
  	
  	def correct_user
  		@user = Post.find(params[:id]).user
  		redirect_to(root_path) unless current_user?(@user)
		end
end
