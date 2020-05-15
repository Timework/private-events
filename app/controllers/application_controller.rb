class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    helper_method :upcoming_events

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    protected
  def authenticate_user!
    if logged_in?

    else
      redirect_to new_sessions_path
    end
  end

end
