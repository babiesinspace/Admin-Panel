class Dashboard::Student::AnnouncementsController < ApplicationController
  before_action :authenticate_student!

  def index
    @cohort = Cohort.find(params[:cohort_id])
    @announcements = @cohort.announcements
  end

  def show
    @announcement = Announcement.find(params[:id])
  end 
end
