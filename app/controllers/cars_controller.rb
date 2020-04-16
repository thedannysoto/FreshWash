class CarsController < ApplicationController

  
    def create 
        @car = Car.create(car_params)
        @car.user = current_user
        @car.save
        redirect_to user_path(current_user)
    end

    def edit
        @car = Car.find(params[:id])
        render layout: "application"
    end

    def update
        @car = Car.find(params[:id])
        @car.update(car_params)
        redirect_to user_path(current_user)
    end
    
    def destroy
        @car = Car.find(params[:id])
        @car.washes.clear
        @car.destroy
        redirect_to user_path(current_user)
    end


    private 

    def current_user
        User.find(session[:user_id])
    end

    def car_params
        params.require(:car).permit(:make, :model, :car_type, :license_plate, :year)
    end
end
