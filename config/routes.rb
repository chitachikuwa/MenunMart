Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, controller: {
    sessions: 'admins/sessions'
   }
  root 'recipes#index'
  resources :recipes, only: [:index, :new, :create ]
end
