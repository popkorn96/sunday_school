class ApplicationController < ActionController::Base
    

    def home
        if session[:teacher_id]
            @teacher = Teacher.find(session[:teacher_id])
            redirect_to @teacher
        end
    end

    def authentication_required
        if !logged_in?
            redirect_to login_path
        end
    end

    def logged_in?
        !!current_user
    end

    def current_user
        @current_user ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
    end
    helper_method :current_user, :logged_in?

    
    private 
    
end
