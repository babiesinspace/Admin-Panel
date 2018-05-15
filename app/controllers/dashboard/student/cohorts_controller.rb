class Dashboard::Student::CohortsController < ApplicationController
  before_action :authenticate_student!
  
  def index
    @student = current_user
    @mycohorts = @student.cohorts.order(startdate: :asc)
    @othercohorts = Cohort.all.where.not(id: @student.cohorts.map(&:id))
  end 

  def show
    @cohort = Cohort.find(params[:id])
  end

  def create
    @student = current_user
    @cohort = Cohort.find(params[:id])
    @student.cohorts << @cohort
    @mycohorts = @student.cohorts.order(startdate: :asc)
  end 

  def destroy
    @student = current_user
    @cohort = Cohort.find(params[:id])
    StudentCohort.find_by(cohort: @cohort, student: @student).destroy
    @mycohorts = @student.cohorts.order(startdate: :asc)
  end 

end
