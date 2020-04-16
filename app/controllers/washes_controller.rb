class WashesController < ApplicationController 

    def index
        @user = current_user
        @washes = @user.washes
        if wash_params.include?("scope")
            if params[:scope] == "ordered_by_price"
                @washes = @user.washes.ordered_by_price
            else
                @washes = @user.washes.ordered_by_car
            end 
        end
        render layout: "main"
    end

    private 

    def current_user
        User.find(session[:user_id])
    end

    def wash_params
        params.permit(:scope)
    end
end