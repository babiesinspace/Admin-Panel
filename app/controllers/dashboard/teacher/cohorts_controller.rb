class Dashboard::Teacher::CohortsController < ApplicationController
  before_action :authenticate_teacher!
end
