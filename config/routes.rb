Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :students
  devise_for :teachers
  devise_for :admins
  root to: "pages#index"
  namespace :dashboard do
    authenticated :student do
        resources :cohorts, module: "student", :only => [:show, :index] do 
          resources :grades, :only => [:show, :index]
          resources :assignments, :only => [:show, :index]
          resources :announcements, :only => [:show, :index]
        end
    end

    authenticated :teacher do
        resources :cohorts, module: "teacher", :only => [:show, :index] do 
          resources :grades
          resources :assignments
          resources :announcements
        end
    end

    authenticated :admin do
        resources :courses, module: "admin" do 
          resources :cohorts
          resources :announcements
        end
    end

    root to: "dashboard#index"
  end
  resources :courses, :only => [:show, :index]
end
