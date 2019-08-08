class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    #User.find_by(:name => params[:user_name]).try(:authenticate,params[:password])
    user = User.find_by(:name => params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def logout
    session.delete :user_id
    redirect_to root_path
  end
end
