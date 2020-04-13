class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create 
        @user = User.create(user_params)
        redirect_to "/signin"
    end
    
    def signin
        @user = User.new
    end

    def login
        @user = User.find_by(email: params[:user][:email])
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show 
        @user = User.find(params[:id])
        render layout: "main"
    end


    private
 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
