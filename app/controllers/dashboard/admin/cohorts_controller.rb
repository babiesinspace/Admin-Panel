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
    @unenrolled = Student.where.not(id: @cohort.students.map(&:id))
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
    if enrollment_params
      params[:student_cohorts][:student_ids].each do |s_id|
        if !s_id.empty?
          @stuco = StudentCohort.new(student_id: s_id.to_i, cohort_id: @cohort.id)
          if !@stuco.save
            render 'edit'
          end 
        end 
      end
    end 
    redirect_to dashboard_course_cohort_path(@cohort.course_id, @cohort)
  end 

  private

  def enrollment_params
    params.require(:student_cohorts).permit(student_ids:[])
  end

  def cohort_params
    params.require(:cohort).permit(:name, :startdate, :enddate, :teacher_id, :course_id)
  end    
end
