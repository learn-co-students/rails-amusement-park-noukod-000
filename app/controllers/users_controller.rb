class UsersController < ApplicationController
  # before_action :require_login
  # skip_before_action :require_login,only:[:create]
  def index
  end

  def new
    @user=User.new
  end


  def update
    @user=User.find(params[:id])
    flash[:message]=@user.rides.last.take_ride
    redirect_to user_path(@user)
  end

  def show
    if session[:user_id].nil?
      redirect_to "/"
    end
    @user=User.find(params[:id])
  end

  def create
    @user=User.create(users_params)
    if @user.valid?
      session[:user_id]=@user.id
      redirect_to user_path(@user)
    else
      redirect_to users_path
    end
  end

  def users_params
     params.require(:user).permit(:name,:happiness,:tickets,:nausea,:password,:height, :admin)
  end

  # def require_login
  #   unless !session[:user_id].nil? || session[:user_id]!=""
  #     redirect_to "/"
  #   end
  # end


end
