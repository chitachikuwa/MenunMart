Rails.application.routes.draw do
  get 'menus/index'
  devise_for :users
  devise_for :admins, controller: {
    sessions: 'admins/sessions'
   }
  root 'recipes#index'
  resources :recipes do
    resources :menus, only: [:index]
  end  
end
