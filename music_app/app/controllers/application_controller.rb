class ApplicationController < ActionController::Base
    helper_method :current_user, :every_band
    
    def log_in_user!(user) 
        session[:session_token] = @user.reset_session_token! 
        # render :show
    end

    def logged_in?
        !!session[:session_token]
    end

    def log_out
        current_user.reset_session_token!
        session[:session_token] = nil 
    end

    def current_user
        User.find_by(session_token: session[:session_token])
    end

    def every_band 
        Band.all 
    end
end
