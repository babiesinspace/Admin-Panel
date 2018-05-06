class Dashboard::Student::AssignmentsController < ApplicationController
  before_action :authenticate_student!

  def index
    @cohort = Cohort.find(params[:cohort_id])
  end 

  def show
    @cohort = Cohort.find(params[:cohort_id])
    @assignment = Assignment.find(params[:id])
  end
  
end
