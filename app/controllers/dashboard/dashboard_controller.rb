class Dashboard::DashboardController < ApplicationController
  
  def index
    current_user
    if current_user.class == Student || current_user.class == Teacher
      redirect_to dashboard_cohorts_path
    elsif current_user.class == Admin
      redirect_to dashboard_courses_path
    end
  end
end
