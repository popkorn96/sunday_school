class ApplicationController < ActionController::Base
    def home 
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end
    def current_user
        session[:email]
    end

    private 

    def teacher_name=(name)
        self.teacher = Teacher.find_by(first_name: name)
        return self.teacher.to_s
    end

    def teacher_name
        self.teacher ? self.teacher.name : nil
    end
    
end
