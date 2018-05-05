class Dashboard::Teacher::CohortsController < ApplicationController
  before_action :authenticate_teacher!

    def index
      @teacher = current_user
      @cohorts = @teacher.cohorts.order(startdate: :asc) 
    end 

    def show
      @cohort = Cohort.find(params[:id])
    end
end
