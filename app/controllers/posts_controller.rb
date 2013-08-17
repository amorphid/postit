class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :update]

  def create
    @post = Post.new(params_post)

    if @post.save
      redirect_to post_path(@path), notice: "Post created successfully"
    else
      render "new"
    end
  end

  def edit
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
  end

  def update
    if @post.update_attributes(params_post)
      redirect_to @post, notice: "Post updated sucessfully"
    else
      render "edit"
    end
  end

private

  def set_post
    @post = Post.find(params[:id])
  end

  def params_post
    params[:post].permit(:title, :url)
  end
end
