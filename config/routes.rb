Rails.application.routes.draw do
  resources :users, except: [ :new, :edit ]
  resources :sessions, only:[ :create]
  resources :items, except: [ :new, :edit]
  root 'application#hello_world'
end
