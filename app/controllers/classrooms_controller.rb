class ClassroomsController < ApplicationController

  def show
    @classroom = Classroom.find(params[:id])
  end

  def index
    @classrooms = Classroom.all
  end

  def new
    @classroom = Classroom.new
  end

  def edit
  end

end
