class UsersController < ApplicationController
    before_action :require_login, only: [:show]

    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.valid? 
            @user.save
            flash[:notice] = "User Created"
            redirect_to "/signin"
        else
            flash[:error] = @user.get_errors
            render :new
        end
    end
    
    def signin
        @user = User.new
    end

    def login
        if params[:user][:email].empty? || params[:user][:password].empty? 
            flash[:error] = "Invalid Email and/or Password"
            redirect_to "/signin"
        else
            @user = User.find_by(email: params[:user][:email])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else  
                flash[:error] = "Invalid Email and/or Password"
                redirect_to "/signin"
            end
        end
    end

    def show 
        @user = User.find(params[:id])
        @cars = @user.cars
        @car = Car.new
        render layout: "main"
    end

    private
 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def require_login
        if !session.include? :user_id
            flash[:error] = "You must be logged in to view that page"
            redirect_to signin_path
        end
    end
    
end
