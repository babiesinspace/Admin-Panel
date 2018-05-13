class Dashboard::Admin::CoursesController < ApplicationController
  before_action :authenticate_admin!

    def index
      @courses = Course.all 
      respond_to do |format|
        format.html
        format.js
      end       
    end 

    def show
      @course = Course.find(params[:id])
    end

    def new

    end 

    def create
      @course = current_user.courses.new(course_params)
      if @course.save
        # Handle a successful update.
        redirect_to dashboard_courses_path
      else
        render 'new'
      end
    end

    def edit
      @course = Course.find(params[:id])
    end 

    def update
      @course = Course.find(params[:id])
      @course.update_attributes(course_params)
      if @course.save
        redirect_to dashboard_courses_path
      else
        render 'edit'
      end
    end

    def destroy
      @course = Course.find(params[:id])
      @course.destroy
      redirect_to dashboard_courses_path
    end 

    private

    def course_params
      params.require(:course).permit(:name, :hours, :level)
    end    
end
