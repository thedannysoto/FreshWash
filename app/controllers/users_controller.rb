class UsersController < ApplicationController


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
            @errors = @user.get_errors
            render :new
        end
    end
    
    def signin
        @user = User.new
    end

    def show 
        @user = User.find(params[:id])
        @cars = @user.cars
        @car = Car.new
        render layout: "main"
    end

    def login
        @user = User.find_by(email: params[:user][:email])
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end


    private
 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
