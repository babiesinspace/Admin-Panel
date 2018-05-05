class Dashboard::Admin::CohortsController < ApplicationController
  before_action :authenticate_admin!
end
