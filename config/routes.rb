Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :students
  devise_for :teachers
  devise_for :admins
  root to: "pages#index"
  namespace :dashboard do
    authenticated :student do
        resources :grades, module: "student", :only => [:show, :index]
        resources :cohorts, module: "student", :only => [:show, :index] do 
          resources :assignments, :only => [:show, :index]
          resources :announcements, :only => [:show, :index]
        end
    end

    authenticated :teacher do
        resources :cohorts, module: "teacher", :only => [:show, :index] do 
          resources :grades, :only => [:edit, :destroy]
          resources :assignments
          resources :announcements
          resources :students, :only => [:show]
        end
        resources :students, module: "teacher", :only => [:index]
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