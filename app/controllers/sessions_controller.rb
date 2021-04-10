class SessionsController < ApplicationController
    def new
    end
    def create
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            session[:username] = user.username
            redirect_to root_url, notice: "Logged in!"
        else
            # flash.now[:alert] = "Email or password is invalid"
            redirect_to :login, notice: "Username or password is invalid"
        end
    end
    def destroy
        session[:user_id] = nil
        redirect_to root_url, notice: "Logged out!"
    end
end