class ClassroomsController < ApplicationController
  before_action :set_classroom, :only => [:show, :edit, :update]


  def show
  end

  def index
    if params[:teacher_id]
      @classroom = Teacher.find(params[:teacher_id]).classrooms 
    else 
    @classrooms = Classroom.all
    end
  end

  def new
    @classroom = Classroom.new
  end

  def edit
  end

  def create 
    @classroom = Classroom.new(classrm_params)
    if @classroom.save
      redirect_to @classroom
    else 
      render:new
    end
  end

  def update
    if @classroom.update(classrm_params)
      redirect_to @classroom
    else 
      render:edit
    end
  end

  def results
    @children = Child.search(params[:])
    render :index
  end


  private

  def set_classroom
    @classroom = Classroom.find(params[:id])
  end

  def classrm_params
    params.require(:classroom).permit(:title, :description, :teacher_id)
  end

end
