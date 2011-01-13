class VotesController < ApplicationController
	before_filter :non_business_filter

	def vote
		@post = Post.find(params[:post])
		@vote = Vote.find_or_create_by_user_id_and_post_id(current_user.id, params[:post])
		@vote.value = params[:value]
		if @vote.save
			@post.vote_total = @post.votes.sum(:value)
			@post.save
			#flash[:success] = "Vote counted!"
		else
			flash[:error] = "No vote!!!"
		end
		respond_to do |format|
			format.html { redirect_to commercial_path(@post.commercial) }
			format.js
		end

	end
	

	
end
