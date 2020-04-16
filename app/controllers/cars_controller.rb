class CarsController < ApplicationController
    before_action :require_login
    before_action :find_car
    skip_before_action :find_car, only: [:create]
    
    layout "application"
  
    def create 
        @car = Car.new(car_params)
        @car.user = current_user
        if @car.valid?
            @car.save
            flash[:notice] = "New Car Added"
            redirect_to user_path(current_user)
        else  
            flash[:error] = @car.get_errors
            @user = current_user
            redirect_to user_path(current_user)
        end 
    end

    def edit
    end

    def update
        @car.update(car_params)
        flash[:notice] = "Car Updated Successfully"
        redirect_to user_path(current_user)
    end
    
    def destroy
        @car.washes.clear
        @car.destroy
        flash[:notice] = "Car Removed"
        redirect_to user_path(current_user)
    end


    private 

    def current_user
        User.find(session[:user_id])
    end

    def car_params
        params.require(:car).permit(:make, :model, :car_type, :license_plate, :year)
    end

    def require_login
        if !session.include? :user_id
            flash[:error] = "You must be logged in to view that page"
            redirect_to signin_path
        end
    end

    def find_car 
        @car = Car.find(params[:id])
    end
end
