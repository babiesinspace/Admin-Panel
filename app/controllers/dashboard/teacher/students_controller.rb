class Dashboard::Teacher::StudentsController < ApplicationController
before_action :authenticate_teacher!

    def index
      @teacher = current_user
      @cohorts = @teacher.cohorts
    end 

    def show
      @student = Student.find(params[:id])
      @stu_cohort = @student.student_cohorts.find_by(cohort_id: params[:cohort_id])
    end
end
