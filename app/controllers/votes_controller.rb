class VotesController < ApplicationController
	before_filter :authorize

	def create
		vote = Vote.new(value: params[:value])
		vote.votable = set_votable
		vote.user = current_user
		vote.save
		redirect_to :back
	end

private

	def set_votable  
		if params.has_key? :post_id
			Post.find(params[:post_id])
		end
	end
end
