Rails.application.routes.draw do
  resources :users, except: [ :new, :edit ]
  resources :sessions, only:[ :create]
  resources :items, except: [ :new, :edit]
  resources :orders, except: [ :new, :edit, :show ]
  resources :processings, except: [ :new, :edit, :index, :update]
  root 'application#hello_world'
end
