class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_email params[:email]
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "You've Logged In!"
    else
      flash.now[:alert] = "Something Went Wrong, Please Try Again!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out!'
  end
end
