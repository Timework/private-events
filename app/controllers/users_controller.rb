class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        @events = @user.events.all
        @upcoming_events = current_user.upcoming_events
        @prev_events = current_user.previous_events
    end


    private
    def user_params
        params.require(:user).permit(:name,:password)
    end

end
