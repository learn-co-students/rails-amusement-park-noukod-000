class UsersController < ApplicationController 

    before_action :find_user, only: [:show, :edit, :update]

    def new
        @user = User.new
    end

    def edit
    end

    def show
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
        #raise session[:user_id].inspect
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    private
    def user_params
          params.require(:user).permit(:name, :password_digest, :happiness, :tickets, :height, :nausea)
    end

    def find_user 
        @user = User.find(params[:id])
    end

end