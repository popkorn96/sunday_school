class TeachersController < ApplicationController
  layout :resolve_layout
  before_action :set_teacher, :only => [:show, :edit, :update, :assignment_index, :assignment]
  before_action :authentication_required, :only => [:show, :index, :edit, :update]
  before_action :redirect_if_not_authorized, :only => [:edit, :update]

  def show
  end

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end
  
  def edit
  end
  
  def create 
    @teacher = Teacher.new(teach_params)
    if @teacher.save
      redirect_to teacher_path(@teacher)
    else 
      render:new
    end
  end

  def update
    if @teacher.update(teach_params)
      redirect_to @teacher
    else
      render:edit
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

  def resolve_layout
    case action_name
    when "new", "create"
      "application"
    when "show", "edit", "update", "index"
      "openapp"
    else
      "application"
    end
  end
  
  private

  def set_teacher
    @teacher = Teacher.find_by_id(params[:id])
  end

  def require_login
    return head(:forbidden) unless session.include? :teacher_id
  end

  def redirect_if_not_authorized
    if current_user.id != @teacher.id
        redirect_to teacher_path(@teacher)
    end
  end

  def teach_params
    params.require(:teacher).permit(:first_name, :last_name, :phone_number, :dl, :volunteer, :email, :password)
  end

end
