class PackagesController < ApplicationController

    def index 
        @packages = Package.all
    end

    def new
        @package = Package.new
        @car = Car.find(params[:car_id])
        @user = current_user
        render layout: "main"
    end

    def create 

    end

    private 

    def current_user
        User.find(session[:user_id])
    end
end
