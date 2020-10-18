class ClassroomsController < ApplicationController
  before_action :set_classroom, :only => [:show, :edit, :update]
  before_action :authentication_required
  before_action :redirect_if_not_authorized, :only => [:new, :edit, :create, :update]


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
    @children = Child.search(params[:query])
    render :index
  end


  private

  def set_classroom
    @classroom = Classroom.find(params[:id])
  end

  def classrm_params
    params.require(:classroom).permit(:title, :description, :teacher_id)
  end

  def redirect_if_not_authorized
    if current_teacher.id != @classroom.teacher_id
        redirect_to classroom_path(@classroom)
    end
  end

end
