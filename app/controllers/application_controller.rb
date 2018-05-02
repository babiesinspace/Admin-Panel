class ApplicationController < ActionController::Base

  devise_group :user, contains: [:student, :teacher, :admin]

end
