class VotesController < ApplicationController
	def create

		# Redirect back to posts if the user is not logged in
		if session[:user_id].nil?
            redirect_to show_post_path(:id => params['id'])
            return
        end

        # Setup all the variables required for voting
		vote_params = {:user_id => session['user_id'], :post_id => params['id'], :vote_type => params['vote_type']}        

		# Either upvote or downvote... A single user cannot do both for a given post
		@vote = Vote.create!(vote_params)
		if vote_params[:vote_type] == "1"
			Vote.where(:vote_type => '0', :post_id => params['id'], :user_id => session['user_id']).destroy_all
		elsif vote_params[:vote_type] == "0"
			Vote.where(:vote_type => '1', :post_id => params['id'], :user_id => session['user_id']).destroy_all
		end
		
		redirect_to show_post_path(:id => params['id'])
  	end



  	private

	def vote_params
		params.require(:vote).permit(:post_id, :vote_type)
	end
end
