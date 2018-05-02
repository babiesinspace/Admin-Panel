Rails.application.routes.draw do
  devise_for :students
  devise_for :teachers
  devise_for :admins
  get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#index"
  namespace :dashboard do
    root to: "dashboard#index"
  end
end
