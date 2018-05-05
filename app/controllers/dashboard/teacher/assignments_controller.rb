class Dashboard::Teacher::AssignmentsController < ApplicationController
  before_action :authenticate_teacher!
end
