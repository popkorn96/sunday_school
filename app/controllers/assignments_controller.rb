class AssignmentsController < ApplicationController

  def show
    @assignment = Assignment.find(params[:id])
  end

  def index
    if params[:teacher_id]
      @assignments = Teacher.find(params[:teacher_id]).assignments
    else
    @assignments = Assignment.all
    end
  end

  def new
    @assignment = Assignment.new
    # get_children
  end

  def edit
    @assignment = Assignment.find(params[:id])
    # get_children
  end

  def create
    @assignment = Assignment.new(assign_params)
    # params[:children][:id].each do |child|
    #   if !child.empty?
    #     @assignment.assignments_children.build(:child_id => child)
    #   end
    if @assignment.save
      redirect_to @assignment
    else 
      render:new
    end
  end

  def update
    @assignment = Assignment.find(params[:id])
    # params[:children][:id].each do |child|
    #   if !child.empty?
    #     @assignment.assignments_children.build(:child_id => child)
    #   end
    if @assignment.update(assign_params)
      redirect_to @assignment
    else 
      render:edit
    end
  end

  private
  # def get_children
  #   @all_children = Child.all
  #   @assignment_child = @assignment.children.build
  # end
  def assign_params
    params.require(:assignment).permit(:title, :description, :due_date, :teacher_id, :assignments_children_attributes => [:id, :child_id => []])
  end

end
