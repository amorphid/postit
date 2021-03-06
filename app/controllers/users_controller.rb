class UsersController < ApplicationController
  before_filter :authorize, only: :show

  def create
    @user = User.new(params_user)

    if @user.save
      redirect_to sign_in_path, notice: "User created successfully"
    else
      render "new"
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
    @posts = @user.posts
    @comments = @user.comments
  end

private

  def params_user
    params[:user].permit(:password, :password_confirmation, :username)
  end
end
