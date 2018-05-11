class Dashboard::Teacher::AssignmentsController < ApplicationController
  before_action :authenticate_teacher!

    #Better to call Assignments?
    def index
      @cohort = Cohort.find(params[:cohort_id])
      respond_to do |format|
        format.html
        format.js
      end
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
      respond_to do |format|
        format.html
        format.js
      end
    end 

    def update
      @assignment = Assignment.find(params[:id])
      @cohort = @assignment.cohort
      if @assignment.update_attributes(assignment_params)
        # Handle a successful update.
        respond_to do |format|
          format.html { redirect_to dashboard_cohort_assignment_path(@assignment.cohort_id, @assignment.id) }
          format.js
        end
      else
        render 'edit'
      end
    end

    def new
      @cohortid = params[:cohort_id]
      respond_to do |format|
        format.html
        format.js
      end
    end

    def create
      @cohort = Cohort.find(params[:cohort_id])
      @assignment = Assignment.new(assignment_params)
      @assignment.cohort = @cohort 
      if @assignment.save
        # Handle a successful creation
        respond_to do |format|
          format.html { redirect_to dashboard_cohort_assignments_path(@assignment.cohort_id)}
          format.js
        end
      else
        render 'new'
      end
    end

    def destroy
      @assignment = Assignment.find(params[:id])
      @assignment.destroy
      @cohort = Cohort.find(params[:cohort_id])
      respond_to do |format|
        format.html {redirect_to dashboard_cohort_assignments_path(@cohort)}
        format.js
      end
    end 

    private

    def assignment_params
      params.require(:assignment).permit(:title, :instructions, :startdate, :enddate)
    end
end
