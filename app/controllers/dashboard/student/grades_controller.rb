class Dashboard::Student::GradesController < ApplicationController
  before_action :authenticate_student!

  def index
    @student = current_user
    @grades = @student.grades
  end 

  def show
    @grade = Grade.find(params[:id])
  end

end
