class Dashboard::Teacher::GradesController < ApplicationController
  before_action :authenticate_teacher!

    def index
      @cohort = Cohort.find(params[:cohort_id])
    end 
    #Don't forget to lock down your routes like this in other controllers!
    def show
      @grade = Grade.find(params[:id])
      @student = @grade.student_cohort.student
      @cohort_id = params[:cohort_id]
      if @grade.student_cohort.cohort_id.to_s == params[:cohort_id]
        render 'show'
      else 
        redirect_to dashboard_cohort_grades_path
      end
    end

    def edit
      @grade = Grade.find(params[:id])
      @student = @grade.student_cohort.student
      @cohort_id = params[:cohort_id]
    end 

    def update
      @grade = Grade.find(params[:id])
      @student = @grade.student_cohort.student
      @cohort_id = params[:cohort_id]
      if @grade.update_attributes(grade_params)
        # Handle a successful update.
        redirect_to dashboard_cohort_grade_path(@cohort_id, @grade.id)
      else
        render 'edit'
      end
    end

    def new
      @cohort = params[:cohort_id]
      @grade = Grade.new
    end

    def create
      @grade = Grade.new(grade_params)
      @grade.cohort_id = params[:cohort_id]
      if @grade.save
        # Handle a successful update.
        redirect_to dashboard_cohort_grades_path
      else
        render 'new'
      end
    end

    def destroy
      @grade = Grade.find(params[:id])
      @grade.destroy
      @cohort = Cohort.find(params[:cohort_id])
      redirect_to dashboard_cohort_grades_path(@cohort)
    end 

    private

    def grade_params
      params.require(:grade).permit(:value)
    end

end
