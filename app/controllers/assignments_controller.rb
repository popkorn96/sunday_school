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
  end

end
