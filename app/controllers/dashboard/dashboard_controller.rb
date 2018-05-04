class Dashboard::DashboardController < ApplicationController
  
  def index
    if current_user.class == Student || Teacher
      redirect_to dashboard_cohorts_path
    elsif current_user.class == Admin
      dashboard_courses_path
    end
  end
end
