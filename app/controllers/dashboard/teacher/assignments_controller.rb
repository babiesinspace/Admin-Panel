class Dashboard::Teacher::AssignmentsController < ApplicationController
  before_action :authenticate_teacher!

    #Better to call Assignments?
    def index
      @cohort = Cohort.find(params[:cohort_id])
    end 

    def show
      @assignment = Assignment.find(params[:id])
      if @assignment.cohort_id.to_s == params[:cohort_id]
        render 'show'
      else 
        redirect_to dashboard_cohort_assignments_path
      end
    end

    def edit
      @assignment = Assignment.find(params[:id])
      
    end 

    def update
      @assignment = Assignment.find(params[:id])
      if @assignment.update_attributes(assignment_params)
        # Handle a successful update.
        redirect_to dashboard_cohort_assignment_path(@assignment.cohort_id, @assignment.id)
      else
        render 'edit'
      end
    end

    def new
      @cohort = params[:cohort_id]
      @assignment = Assignment.new
    end

    def create
      @assignment = Assignment.new(assignment_params)
      @assignment.cohort_id = params[:cohort_id]
      if @assignment.save
        # Handle a successful update.
        redirect_to dashboard_cohort_assignments_path
      else
        render 'new'
      end
    end

    def destroy
      @assignment = Assignment.find(params[:id])
      @assignment.destroy
      @cohort = Cohort.find(params[:cohort_id])
      redirect_to dashboard_cohort_assignments_path(@cohort)
    end 

    private

    def assignment_params
      params.require(:assignment).permit(:title, :instructions, :startdate, :enddate)
    end
end
