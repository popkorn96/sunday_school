class TeachersController < ApplicationController
  before_action :set_teacher, :only => [:assignment_index, :assignment]
  before_action :require_login

  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
    @teacher = Teacher.new
  end

  def edit
    @teacher = Teacher.find(params[:id])
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
    @teacher = Teacher.find(params[:id])
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

  def require_login
    return head(:forbidden) unless session.include? :teacher_id
  end

  def teach_params
    params.require(:teacher).permit(:first_name, :last_name, :phone_number, :dl, :volunteer, :email, :password)
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

end
