class Dashboard::Teacher::AnnouncementsController < ApplicationController
  before_action :authenticate_teacher!

    def index
      @cohort = Cohort.find(params[:cohort_id])
      respond_to do |format|
        format.html
        format.js
      end
    end 
    #Don't forget to lock down your routes like this in other controllers!
    def show
      @announcement = Announcement.find(params[:id])
      if @announcement.cohort_id.to_s == params[:cohort_id]
        render 'show'
      else 
        redirect_to dashboard_cohort_announcements_path
      end
    end

    def edit
      @announcement = Announcement.find(params[:id])
    end 

    def update
      @announcement = Announcement.find(params[:id])
      @cohort = @announcement.cohort
      if @announcement.update_attributes(announcement_params)
        # Handle a successful update.
        respond_to do |format|
          format.html { redirect_to dashboard_cohort_announcement_path(@cohort, @announcement.id) }
          format.js
        end
      else
        render 'edit'
      end
    end

    def new
      @cohortid = params[:cohort_id]
      @announcement = Announcement.new
    end

    def create
      @cohort = Cohort.find(params[:cohort_id])
      @announcement = Announcement.new(announcement_params)
      @announcement.cohort = @cohort 
      if @announcement.save
        # Handle a successful update.
        respond_to do |format|
          format.html { redirect_to dashboard_cohort_announcements_path }
          format.js
        end
      else
        render 'new'
      end
    end

    def destroy
      @announcement = Announcement.find(params[:id])
      @announcement.destroy
      @cohort = Cohort.find(params[:cohort_id])
      respond_to do |format|
        format.html {redirect_to dashboard_cohort_announcements_path(@cohort)}
        format.js
      end
    end 

    private

    def announcement_params
      params.require(:announcement).permit(:title, :body, :startdate, :enddate)
    end
end
