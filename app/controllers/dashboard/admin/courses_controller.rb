class Dashboard::Admin::CoursesController < ApplicationController
  before_action :authenticate_admin!
end
