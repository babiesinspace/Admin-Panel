class Dashboard::Admin::EnrolleesController < ApplicationController
  before_action :authenticate_admin!

    def show
      redirect_to dashboard_student_path(params[:id])
    end

    def destroy
      student = Student.find(params[:id])
      enrollment = student.student_cohorts.find_by(cohort_id: params[:cohort_id])
      enrollment.destroy
      if student.cohorts.any?
        redirect_to dashboard_student_path(student.id)
      else
        student.destroy
        redirect_to dashboard_course_cohort_path(params[:course_id], params[:cohort_id])
      end 
    end 

end
