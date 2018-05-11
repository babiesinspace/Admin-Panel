class Dashboard::Teacher::GradesController < ApplicationController
  before_action :authenticate_teacher!

    def index
      @cohort = Cohort.find(params[:cohort_id])
    end 
    #Don't forget to lock down your routes like this in other controllers!
    def show
      @grade = StudentCohort.find(params[:id])
      if @grade.cohort_id.to_s == params[:cohort_id]
        render 'show'
      else 
        redirect_to dashboard_cohort_grades_path
      end
    end

    def edit
      @grade = StudentCohort.find(params[:id])
    end 

    def update
      @grade = StudentCohort.find(params[:id])
      if @grade.update_attributes(grade_params)
        # Handle a successful update.
        redirect_to dashboard_cohort_grade_path(@grade.cohort_id, @grade.id)
      else
        render 'edit'
      end
    end

    def destroy
      #Find the student and delete their join table row - no longer associating them with that cohort
      @grade = StudentCohort.find(params[:id])
      student = Student.find(@grade.student_id)
      cohort_id = @grade.cohort_id
      @grade.destroy
      #if the student doesn't have any other cohorts they have signed up for, delete them from the database
      if !student.cohorts.any?
        student.destroy
      end
      redirect_to dashboard_cohort_grades_path(cohort_id)
    end 

    private

    def grade_params
      params.require(:student_cohort).permit(:grade)
    end

end
