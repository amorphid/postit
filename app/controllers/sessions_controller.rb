class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Session created successfully"
    else
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Session destroyed successfully"
  end

  def new
  end
end
