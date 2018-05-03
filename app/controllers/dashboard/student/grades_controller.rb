class Dashboard::Student::GradesController < ApplicationController
  before_action :authenticate_student!
end
