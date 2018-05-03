class Dashboard::Teacher::AnnouncementsController < ApplicationController
  before_action :authenticate_teacher!

end
