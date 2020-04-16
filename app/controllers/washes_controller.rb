class WashesController < ApplicationController 
    before_action :require_login
    layout "main"
    
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
    end

    private 

    def current_user
        User.find(session[:user_id])
    end

    def wash_params
        params.permit(:scope)
    end

    def require_login
        if !session.include? :user_id
            flash[:error] = "You must be logged in to view that page"
            redirect_to signin_path
        end
    end
end