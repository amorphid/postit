class CommentsController < ApplicationController
  before_filter :authorize

  def create
    @post     = Post.find(params[:post_id])
    @comment  = Comment.new(comment_params)
    @comments = @post.comments # requires for "posts/show"
    @comment.post = @post
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post)
    else
      render "posts/show"
    end
  end

private

  def comment_params
    comment_params = params[:comment].permit(:body)
  end
end
