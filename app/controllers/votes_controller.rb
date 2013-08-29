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

  def find_or_initialize_vote
    Vote.find_or_initialize_by(votable: set_votable, user_id: current_user.id)
  end

  def identical?
    @vote.value == params[:value].to_i
  end

  def opposite?
    @vote.value == params[:value].to_i * -1
  end

  def set_votable
    if params.has_key? :post_id
      @voteable = Post.find(params[:post_id])
    elsif params.has_key? :comment_id
      @voteable = Comment.find(params[:comment_id])
    end
  end
end
