class Dashboard::Student::CohortsController < ApplicationController
  before_action :authenticate_student!
  
  def index
  end 

end
