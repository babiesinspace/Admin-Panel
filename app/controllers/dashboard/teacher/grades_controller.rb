class Dashboard::Teacher::GradesController < ApplicationController
  before_action :authenticate_teacher!
end
