Rails.application.routes.draw do
  
  get 'history/show/:user_id', to: 'history#show'
  post 'history/search', to: 'history#search', as: :search
  resources :users, except: [ :new, :edit, :index ] do
    post :user_show, on: :collection
    post 'index',     on: :collection
  end
  resources :sessions, only:[ :create]
  resources :items, except: [ :new, :edit]
  resources :orders, except: [ :new, :edit, :show ] do
    get :deleteAll, on: :collection
    post :pay, on: :collection
  end
  resources :processings, except: [ :new, :edit, :index, :update]
  resources :shoppings, except: [ :new, :edit ]
  resources :shopping_phone, only:[:create]
  resources :sales, only: [:index]
  root 'application#hello_world'
end
