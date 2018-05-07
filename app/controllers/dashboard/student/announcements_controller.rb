class Dashboard::Student::AnnouncementsController < ApplicationController
  before_action :authenticate_student!

  #RESEARCH - is it better (re: database usage/technical debt) to grab both or just use the association on announcements
  def index
    @cohort = Cohort.find(params[:cohort_id])
    @announcements = @cohort.announcements
  end

  #Don't forget to lock down your routes like this in other controllers!
  def show
    @cohort = Cohort.find(params[:cohort_id])
    @announcement = Announcement.find(params[:id])
    if @announcement.cohort_id.to_s == @cohort.id
      render 'show'
    else 
      redirect_to dashboard_cohort_announcements_path
    end
  end
end
