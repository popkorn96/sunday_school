class SessionsController < ApplicationController

  def new
    @teacher = Teacher.new
  end

  def create
    if auth 
      user = Teacher.find_or_create_by_omniauth(auth)
      session[:teacher_id] = user.id
      redirect_to teacher_path(user)
    else 
      user = Teacher.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:teacher_id] = user.id
        redirect_to teacher_path(user)
      else
      render 'sessions/new'
      end
    end
  end

	def destroy
		session.delete(:teacher_id)
    @current_user = nil
    redirect_to root_path
	end

	private
	def auth
    	request.env['omniauth.auth']
  end
end