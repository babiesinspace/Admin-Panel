class Dashboard::Admin::AnnouncementsController < ApplicationController
  before_action :authenticate_admin!

    def index
      @cohort = Cohort.find(params[:cohort_id])
    end 

    def show
      @cohort = Cohort.find(params[:cohort_id])
      @announcement = @cohort.announcements.find(params[:id])
    end

    def new
      @announcement = Announcement.new
    end 

    def create
      @announcement = Announcement.new(announcement_params)
      cohort = params[:cohort_id]
      @announcement.cohort_id = cohort
      if @announcement.save
        # Handle a successful update.
        redirect_to dashboard_course_cohort_announcements_path
      else
        render 'new'
      end
    end

    def edit
      @announcement = Announcement.find(params[:id])
    end 

    def update
      @announcement = Announcement.find(params[:id])
      @announcement.update_attributes(announcement_params)
      if @announcement.save
        redirect_to dashboard_course_cohort_announcements_path
      else
        render 'edit'
      end
    end

    def destroy
      @announcement = Announcement.find(params[:id])
      @announcement.destroy
      redirect_to dashboard_course_cohort_announcements_path
    end 

    private

    def announcement_params
      params.require(:announcement).permit(:title, :body, :startdate, :enddate, :cohort_id)
    end

end
