class ClassroomsController < ApplicationController

  def show
    @classroom = Classroom.find(params[:id])
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
    @classroom = Classroom.find(params[:id])
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
    @classroom = Classroom.find(params[:id])
    if @classroom.update(classrm_params)
      redirect_to @classroom
    else 
      render:edit
    end
  end

  def teacher_name=(name)
    self.teacher = Teacher.find_by(first_name: name)
    return self.teacher.to_s
  end

  def teacher_name
     self.teacher ? self.teacher.name : nil
  end

  private

  def classrm_params
    params.require(:classroom).permit(:title, :description, :teacher_id)
  end

end
