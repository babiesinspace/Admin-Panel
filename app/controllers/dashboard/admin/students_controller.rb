class Dashboard::Admin::StudentsController < ApplicationController
  before_action :authenticate_admin!

end
