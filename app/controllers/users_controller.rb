class UsersController < ApplicationController
  def create
    @user = User.new(params_user)

    if @user.save
      redirect_to posts_path, notice: "User created successfully"
    else
      render "new"
    end
  end

  def new
    @user = User.new
  end

private

  def params_user
    params[:user].permit(:password, :password_confirmation, :username)
  end
end
