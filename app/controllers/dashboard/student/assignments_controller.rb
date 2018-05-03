class Dashboard::Student::AssignmentsController < ApplicationController
  before_action :authenticate_student!
end
