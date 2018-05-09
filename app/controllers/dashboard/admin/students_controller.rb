class Dashboard::Admin::StudentsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @students = Student.all 
  end 

  def show
    @student = Student.find(params[:id])
  end 

  def edit
    @courses = Course.all
    @student = Student.find(params[:id])
  end 
  
  def addcohort
    @student = Student.find(params[:student_id])
    if !@student.student_cohorts.find_by(cohort_id: params[:student_cohorts][:cohort_id]).nil?
      @student.errors[:enrolled] << "in this course already!"
      @courses = Course.all 
      render 'edit'
    else
      @student.student_cohorts.create(registration_params)
      redirect_to dashboard_student_path(@student)
    end  
  end 

  def destroy
    student = Student.find(params[:id])
    student.destroy
    redirect_to dashboard_students_path
  end 

  private 

  def registration_params
    params.require(:student_cohorts).permit(:cohort_id)
  end

end
