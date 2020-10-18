class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update]
  before_action :authentication_required
  
  def show
  end

  def index
    if params[:teacher_id]
      @assignments = Teacher.find(params[:teacher_id]).assignments
    else
    @assignments = Assignment.all
    end
  end

  def new
    if params[:teacher_id] && !Teacher.exists?(params[:teacher_id])
      redirect_to teachers_path, alert: "Teacher not found."
    else
      @assignment = Assignment.new(teacher_id: params[:teacher_id])
    end
  end

  def edit
    if params[:teacher_id]
      teacher = Teacher.find_by(id: params[:teacher_id])
      if teacher.nil?
        redirect_to teachers_path, alert: "Teacher not found."
      else 
        @assignment = teacher.assignments.find_by(id: params[:id])
        redirect_to teacher_assignments_path(teacher), alert: "Assignment not found." if @assignment.nil?
      end
    end
  end

  def create
    @assignment = Assignment.new(assign_params)
    if @assignment.save
      redirect_to @assignment
    else 
      render:new
    end
  end

  def update
    if @assignment.update(assign_params)
      redirect_to @assignment
    else 
      render:edit
    end
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  def assign_params
    params.require(:assignment).permit(:title, :description, :due_date, :teacher_id, child_ids:[], children_attributes: [:first_name, :last_name])
  end

end
