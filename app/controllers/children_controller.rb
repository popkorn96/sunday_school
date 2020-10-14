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
      redirect_to @teacher
    else
      render:new
    end
  end
  
  def update
    @child = Child.find(params[:id])
    if @child.update
      redirect_to @child
    else
      render:edit
    end
  end

  private

  def child_params
    params.require(:child).permit(:first_name, :last_name, :age, :favorite_color)
  end

end
