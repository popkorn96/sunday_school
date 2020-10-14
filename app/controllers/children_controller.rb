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
  end

end
