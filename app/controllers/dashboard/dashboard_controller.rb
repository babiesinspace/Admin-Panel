class Dashboard::DashboardController < ApplicationController
  
  def index
    if current_user.class == Student || current_user.class == Teacher
      redirect_to dashboard_cohorts_path
    elsif current_user.class == Admin
      render 'index'
    else
      redirect_to root_path
    end
  end
  
end
