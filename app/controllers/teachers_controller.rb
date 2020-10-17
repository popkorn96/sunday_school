class TeachersController < ApplicationController
  before_action :set_teacher, :only => [:show, :edit, :update, :assignment_index, :assignment]
  before_action :require_login

  def show
  end

  def new
    if params[:teacher_id] && !Teacher.exists?(params[:teacher_id])
      redirect_to teachers_path, alert: "Teacher not found."
    else
      @teacher = Teacher.new(teacher_id: params[:teacher_id])
    end
  end

  
  def edit
  end
  
  def create 
    @teacher = Teacher.new(teach_params)
    if @teacher.save
      redirect_to @teacher
    else 
      render:new
    end
  end

  def update
    if @teacher.update(teach_params)
      redirect_to @teacher
    else
      render :edit
    end
  end

  def assignment_index
    @assignments = Teacher.assignments
    render template: 'assignments/index'
  end

  def assignment
    @assignment = Assignment.find(params[:assignment_id])
    render template: 'assignments/show'
  end
  
  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def require_login
    return head(:forbidden) unless session.include? :teacher_id
  end

  def teach_params
    params.require(:teacher).permit(:first_name, :last_name, :phone_number, :dl, :volunteer, :email, :password)
  end


end
