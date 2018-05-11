class Dashboard::Admin::TeachersController < ApplicationController
before_action :authenticate_admin!
  def index
    @teachers = Teacher.all 
  end 

  def show
    @teacher = Teacher.find(params[:id])
  end 

  def edit
    @courses = Course.all
    @teacher = Teacher.find(params[:id])
  end 
  
  def update
    @teacher = Teacher.find(params[:id])
    @teacher.salary.update_attributes(salary_params)
    redirect_to dashboard_teacher_path(@teacher)
  end 

  def destroy
    teacher = Teacher.find(params[:id])
    teacher.destroy
    redirect_to dashboard_teachers_path
  end 

  private 

  def salary_params
    params.require(:salary).permit(:income)
  end

end
