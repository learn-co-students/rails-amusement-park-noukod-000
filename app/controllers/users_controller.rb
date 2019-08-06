class UsersController < ApplicationController
  before_action :authentification_required,only: [:show]
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    # user.name = params[:user][:name]
    # user.password = params[:user][:password]
    # user.nausea = params[:user][:nausea]
    # user.happiness = params[:user][:happiness]
    # user.height = params[:user][:height]
    # user.tickets = params[:user][:tickets]
    if user.save
      session['user_id'] = user.id
      redirect_to user_path(user)
    else
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name,:password,:nausea,:happiness,:height,:tickets)
  end
end
