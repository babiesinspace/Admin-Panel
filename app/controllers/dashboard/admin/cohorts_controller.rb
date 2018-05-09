class Dashboard::Admin::CohortsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @cohort = Cohort.find(params[:id])
  end

  def new
    @course = Course.find(params[:course_id])
  end 

  def create
    course = Course.find(params[:course_id])
    @cohort = Cohort.new(cohort_params)
    if @cohort.save
      # Handle a successful update.
      redirect_to dashboard_course_path(course)
    else
      render 'new'
    end
  end

  def edit
    @cohort = Cohort.find(params[:id])
  end 

  def update
    @cohort = Cohort.find(params[:id])
    @cohort.update_attributes(cohort_params)
    if @cohort.save
      redirect_to dashboard_course_path(@cohort.course_id)
    else
      render 'edit'
    end
  end

  def destroy
    course_id = params[:course_id]
    @cohort = Cohort.find(params[:id])
    @cohort.destroy
    redirect_to dashboard_course_path(course_id)
  end 

  def addstudents
    @cohort = Cohort.find(params[:cohort_id])
    if !@cohort.student_cohorts.find_by(student_id: params[:student_cohorts][:student_id]).nil?
      @cohort.errors[:enrolled] << "in this course already!"
      @students = Student.all 
      render 'edit'
    else
      @cohort.student_cohorts.create(enrollment_params)
      redirect_to dashboard_course_cohort_path(@cohort.course_id, @cohort)
    end  
  end 

  private

  def enrollment_params
    params.require(:student_cohorts).permit(:student_id)
  end

  def cohort_params
    params.require(:cohort).permit(:name, :startdate, :enddate, :teacher_id, :course_id)
  end    
end
