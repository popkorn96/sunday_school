class ApplicationController < ActionController::Base
    def authentication_required
        if !logged_in?
            redirect_to login_path
        end
    end
    def logged_in?
        !!current_user
    end
    def current_teacher
        @current_user ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
    end
    helper_method :current_user
    def home 
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end

    private 
    
end
