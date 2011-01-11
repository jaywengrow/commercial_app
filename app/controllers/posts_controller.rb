class PostsController < ApplicationController
	before_filter :authenticate
	before_filter :non_business_filter
	
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
end
