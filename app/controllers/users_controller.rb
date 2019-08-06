class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new
    user.name = params[:user][:name]
    user.password = params[:user][:password]
    user.nausea = params[:user][:nausea]
    user.happiness = params[:user][:happiness]
    user.height = params[:user][:height]
    user.tickets = params[:user][:tickets]
    user.save
    redirect_to user_path(user)
  end

  def show
    @user = User.find(params[:id])
  end
end
