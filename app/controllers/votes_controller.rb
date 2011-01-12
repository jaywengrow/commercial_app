class VotesController < ApplicationController

	def vote
		@post = Post.find(params[:post])
		@vote = Vote.find_or_create_by_user_id_and_post_id(current_user.id, params[:post])
#		@vote ||= Vote.new
#		@vote.user_id = current_user.id
		@vote.value = params[:value]
		if @vote.save
			flash[:success] = "Vote counted!"
		else
			flash[:error] = "No vote!!!"
		end
		redirect_to commercial_path(@post.commercial)
	end
	

	
end
