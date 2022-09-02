class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create        
        @user = User.find_by(email: user_params[:email])
                
        if @user && @user.password == user_params[:password]        
            cookies[:user_id] = @user.id
            redirect_to :controller => 'welcome', :action => 'home'
        else
            flash.now[:notice] = "Invalid email or password. Sign-in again"
            render 'new'
        end
    end

    def destroy
    end
    
    private
        def user_params
            params.require(:user).permit(:email, :password)
        end    
end
