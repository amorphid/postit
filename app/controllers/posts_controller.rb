class PostsController < ApplicationController
  before_filter :set_post, [:edit, :shot, :update]

  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to @post, notice: "Post created successfully"
    else
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    if @post = Post.update_attributes(params[:post])
      redirect_to @post, notice: "Post updated sucessfully"
  end

private

  def set_post
    @post = Post.find(params[:id])
  end

  def entry_params
  end
end
