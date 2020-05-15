class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_name(params[:session][:name])
        if user != nil
        session[:user_id] = user.id
        flash[:success] = "User logged in"
        redirect_to user_path(user)        
        else
            render :new      
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "Logged out"
        redirect_to new_sessions_path
    end
end
