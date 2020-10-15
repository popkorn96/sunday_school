class ParentsController < ApplicationController

  def show
    @parent = Parent.find(params[:id])
  end

  def new
    @parent = Parent.new
  end

  def edit
    @parent = Parent.find(params[:id])
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      redirect_to @parent
    else 
      render :new
    end
  end

  def update
    @parent = Parent.find(params[:id])
    if @parent.update(parent_params)
      redirect_to @parent
    else
      render:new
    end
  end

  private
  def parent_params
    params.require(:parent).permit(:first_name, :last_name, :phone_number, :emergency_name, :emergency_number, :email, :password)
  end
end
