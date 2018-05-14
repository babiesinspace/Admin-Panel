Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :students
  devise_for :teachers
  devise_for :admins
  root to: "pages#index"
  namespace :dashboard do
    authenticated :student do
        resources :grades, module: "student", :only => [:index]
        resources :cohorts, module: "student", :only => [:show, :index, :create] do 
          resources :assignments, :only => [:show, :index]
          resources :announcements, :only => [:show, :index]
          resources :grades, only: [:show]
        end
    end

    authenticated :teacher do
        resources :cohorts, module: "teacher", :only => [:show, :index] do 
          resources :grades, :only => [:show, :index, :edit, :update, :destroy]
          resources :assignments
          resources :announcements
          resources :students, :only => [:show]
        end
        resources :students, module: "teacher", :only => [:index]
    end

    authenticated :admin do
        resources :courses, module: "admin" do 
          resources :cohorts, except: [:index] do 
            resources :announcements
            resources :enrollees, only: [:show, :destroy]
            post '/students', to: "cohorts#addstudents"
          end
        end
        resources :students, module: "admin" do 
          post '/cohorts', to: "students#addcohort"
        end 
        resources :teachers, module: "admin"
    end

    root to: "dashboard#index"
  end
  resources :courses, :only => [:show, :index]
end
