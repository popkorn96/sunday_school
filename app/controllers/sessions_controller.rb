class SessionsController < ApplicationController

  def new
    @teacher = Teacher.new
  end

  def create
    user = Teacher.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:teacher_id] = user.id
      redirect_to teacher_path(user)
    else
      render 'sessions/new'
    end
  end
    
end
