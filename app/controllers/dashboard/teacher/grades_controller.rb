class Dashboard::Teacher::GradesController < ApplicationController
  before_action :authenticate_teacher!

    def index
      @cohort = Cohort.find(params[:cohort_id])
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
      if @announcement.update_attributes(announcement_params)
        # Handle a successful update.
        redirect_to dashboard_cohort_announcement_path(@announcement.cohort_id, @announcement.id)
      else
        render 'edit'
      end
    end

    def new
      @cohort = params[:cohort_id]
      @announcement = Announcement.new
    end

    def create
      @announcement = Announcement.new(announcement_params)
      @announcement.cohort_id = params[:cohort_id]
      if @announcement.save
        # Handle a successful update.
        redirect_to dashboard_cohort_announcements_path
      else
        render 'new'
      end
    end

    def destroy
      @announcement = Announcement.find(params[:id])
      @announcement.destroy
      @cohort = Cohort.find(params[:cohort_id])
      redirect_to dashboard_cohort_announcements_path(@cohort)
    end 

    private

    def announcement_params
      params.require(:announcement).permit(:title, :body, :startdate, :enddate)
    end

end
