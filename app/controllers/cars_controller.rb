class CarsController < ApplicationController

  
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
        @car = Car.find(params[:id])
        render layout: "application"
    end

    def update
        @car = Car.find(params[:id])
        @car.update(car_params)
        flash[:notice] = "Car Updated Successfully"
        redirect_to user_path(current_user)
    end
    
    def destroy
        @car = Car.find(params[:id])
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
end
