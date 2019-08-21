class SessionsController < ApplicationController 
    def create
        @user =  User.new
        @users = User.all 
    end
end