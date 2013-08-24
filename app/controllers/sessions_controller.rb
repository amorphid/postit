class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Session created successfully"
    else
      render "new"
    end
  end

  def new
  end
end
