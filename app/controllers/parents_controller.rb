class ParentsController < ApplicationController
  layout "openapp"
  before_action :redirect_if_not_authorized, :only => [:new, :create, :edit, :update]
  before_action :authentication_required

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
    params.require(:parent).permit(:first_name, :last_name, :phone_number, :emergency_name, :emergency_number, :email, child_ids:[], children_attributes: [:first_name, :last_name])
  end
  def redirect_if_not_authorized
    @child = Child.find_by(params[:id])
    if current_user.id != @child.classroom.teacher.id
        redirect_to child_path(@child)
    end
  end
end
