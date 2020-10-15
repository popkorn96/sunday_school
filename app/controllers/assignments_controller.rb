class AssignmentsController < ApplicationController

  def show
    @assignment = Assignment.find(params[:id])
  end

  def index
    @assignments = Assignment.all
  end

  def new
    @assignment = Assignment.new
  end

  def edit
    @assignment = Assignment.find(params[:id])
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
    @assignment = Assignment.find(params[:id])
    if @assignment.update(assign_params)
      redirect_to @assignment
    else 
      render:edit
    end
  end

  private

  def assign_params
    params.require(:assignment).permit(:title, :description, :due_date, :parent_id, :child_id)
  end

end
