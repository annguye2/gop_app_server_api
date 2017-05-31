Rails.application.routes.draw do
  resources :shareprojects
  resources :projects
  resources :users
  resources :features
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
