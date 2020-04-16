class PackagesController < ApplicationController
    before_action :require_login
    layout "main"


    def new
        @packages = Package.all
        @package = Package.new
        @car = Car.find(params[:car_id])
        @user = current_user
    end

    def create 
        package = Package.find(params[:package][:package_id])
        car = Car.find(params[:car_id])
        wash = Wash.new
        wash.package = package
        wash.car = car 
        wash.save
        flash[:notice] = "#{car.make} #{car.model} has been washed with the #{package.name} package"
        redirect_to user_path(current_user)
    end

    private 

    def current_user
        User.find(session[:user_id])
    end

    def package_params
        params.require(:package).permit(:package_id)
    end

    def require_login
        if !session.include? :user_id
            flash[:error] = "You must be logged in to view that page"
            redirect_to signin_path
        end
    end
end
