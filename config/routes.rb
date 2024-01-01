Rails.application.routes.draw do
  get 'menus/index'
  devise_for :users
  devise_for :admins, controller: {
    sessions: 'admins/sessions'
   }
  root 'recipes#index'
  resources :recipes 
  resources :menus, only: [:index, :new, :create]
  get '/carender/:date', to: 'menus#new', as: :new_menu_for_date
end
