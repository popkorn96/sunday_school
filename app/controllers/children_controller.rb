class ChildrenController < ApplicationController

  def show
    @child = Child.find(params[:id])
  end

  def index
    @children = Child.all
  end

  def new
    @child = Child.new
  end

  def edit
    @child = Child.find(params[:id])
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
    @child = Child.find(params[:id])
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

  def child_params
    params.require(:child).permit(:first_name, :last_name, :age, :favorite_color, :classroom_id, :parent_id)
  end

end
