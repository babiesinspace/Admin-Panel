class Dashboard::Student::AssignmentsController < ApplicationController
  before_action :authenticate_student!

  def index

  end 
  
end
