class VotesController < ApplicationController
	before_filter :authorize

  def create
    @vote = find_or_initialize_vote

		case
    when identical? then @vote.destroy
    when opposite?  then @vote.update_attributes(value: params[:value])
    else
      @vote.value = params[:value]
      @vote.save
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: @voteable.score } # score is an integer
    end
	end

private

  def identical?
    @vote.value == params[:value].to_i
  end

  def opposite?
    @vote.value == params[:value].to_i * -1
  end

	def find_or_initialize_vote
		if params.has_key? :post_id
      @voteable = Post.find(params[:post_id])
			Vote.find_or_initialize_by(votable: @voteable, user_id: current_user.id)
		end
	end
end
