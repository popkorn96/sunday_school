class ApplicationController < ActionController::Base
    helper_method :current_teacher, :logged_in?

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
        !!current_teacher
    end

    def current_teacher
        @current_user ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
    end



    
    private 
    
end
