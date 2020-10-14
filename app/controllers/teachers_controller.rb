class TeachersController < ApplicationController

  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
    @teacher = Teacher.new
  end

  def edit
  end
  
  def create 
    @teacher = Teacher.new(teach_params)
    if @teacher.save
      redirect_to @teacher
    else 
      render:new
    end
  end



  private

  def teach_params
    params.require(:teacher).permit(:first_name, :last_name, :phone_number, :dl, :volunteer, :email, :password)
  end

end
