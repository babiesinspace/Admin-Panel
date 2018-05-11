class Dashboard::Student::GradesController < ApplicationController
  before_action :authenticate_student!

  def index
    @student = current_user
    @grades = @student.get_grades
  end 

  def show
    @grade = StudentCohort.find(params[:id]).student.get_course_grade(params[:cohort_id])
  end

end
