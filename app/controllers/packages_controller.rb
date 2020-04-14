class PackagesController < ApplicationController

    def index 
        @packages = Package.all
    end

    def new
        @packages = Package.all
        @package = Package.new
        @car = Car.find(params[:car_id])
        @user = current_user
        render layout: "main"
    end

    def create 
        package = Package.find(params[:package][:package_id])
        car = Car.find(params[:car_id])
        wash = Wash.new
        wash.package = package
        wash.car = car 
        wash.save
        redirect_to user_path(current_user)
    end

    private 

    def current_user
        User.find(session[:user_id])
    end

    def package_params
        params.require(:package).permit(:package_id)
    end
end
