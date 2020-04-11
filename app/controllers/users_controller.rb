class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create 
        User.create(user_params)
    end
    
    def signin
        @user = User.new
    end

    def login
        
    end

    def show 

    end


    private
 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
