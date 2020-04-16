class SessionsController < ApplicationController 
    layout 'home'
    
    def index
        render 'welcome/index'
    end
    
    # Facebook Login
    def create
      @user = User.find_by(uid: auth['uid'])
      if @user
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        @user = User.new
        @user.uid = auth['uid']
        @user.name = auth['info']['name']
        @user.email = auth['info']['email']
        @user.password = SecureRandom.hex(13)
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    end

    def destroy
      session.delete :user_id
      redirect_to root_path
    end
     
      private
     
      def auth
        request.env['omniauth.auth']
      end
end