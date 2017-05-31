Rails.application.routes.draw do
  resources :shareprojects
  resources :projects
  resources :users
  resources :features


  root 'welcome#index' #set root


  resources :user do
    resource :projects
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
