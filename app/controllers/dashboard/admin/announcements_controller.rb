class Dashboard::Admin::AnnouncementsController < ApplicationController
  before_action :authenticate_admin!
end
