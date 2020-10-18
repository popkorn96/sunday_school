class ChildrenController < ApplicationController
  before_action :set_child, :only => [:show, :edit, :update]
  before_action :authentication_required
  before_action :redirect_if_not_authorized, :only => [:edit, :update]

  def show
  end

  def index
    if params[:classroom_id]
      @children = Classroom.find(params[:classroom_id]).children
    else
    @children = Child.all
    end
  end

  def new
    if params[:classroom_id] && !Classroom.exists?(params[:classroom_id])
      redirect_to classrooms_path, alert: "Classroom not found."
    else
      @child = Child.new(classroom_id: params[:classroom_id])
    end
  end

  def edit
    if params[:classroom_id]
      classroom = Classroom.find_by(id: params[:classroom_id])
      if classroom.nil?
        redirect_to classrooms_path, alert: "Classroom not found."
      else
        @child = classroom.children.find_by(id: params[:id])
        redirect_to classroom_children_path(classroom), alert: "Student not found." if @child.nil?
      end
    end
  end

  def create
    @child = Child.new(child_params)
    if @child.save
      redirect_to @child
    else
      render:new
    end
  end
  
  def update
    if @child.update(child_params)
      redirect_to @child
    else
      render:edit
    end
  end

  def parent_name=(name)
    byebug
    self.parent = Parent.find_or_create_by(first_name: first_name)
  end
  

  def parent_name
     self.parent ? self.parent.name : nil
  end 

  def classroom_name=(name)
    self.classroom = Classroom.find_by(title: name)
  end

  def classroom_name
    self.classroom ? self.classroom.name : nil
  end

  private

  def set_child
    @child = Child.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:first_name, :last_name, :age, :favorite_color, :classroom_id, :parent_id)
  end

  def redirect_if_not_authorized
    if current_teacher.id != @child.classroom.teacher.id
        redirect_to classroom_path(@child)
    end
  end

end
