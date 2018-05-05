class Dashboard::Student::CohortsController < ApplicationController
  before_action :authenticate_student!
  
  def index
    @student = current_user
    @cohorts = @student.cohorts.order(startdate: :asc) 
  end 

  def show
    @cohort = Cohort.find(params[:id])
  end

end
