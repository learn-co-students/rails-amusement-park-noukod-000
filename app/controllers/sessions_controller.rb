class SessionsController < ApplicationController

  def signin
  end

  def create

    @user=User.find(params[:user][:name])

    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect_to user_path @user
    else
      redirect_to "/"
    end
  end

  def destroy
    if !session[:user_id].nil?
      session.delete :user_id
      redirect_to "/"
    end
  end


end
