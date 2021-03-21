Rails.application.routes.draw do
  
  post 'history/show/', to: 'history#show'
  post 'history/search', to: 'history#search', as: :search
  resources :users, except: [ :new, :edit, :index, :show] do
    post :user_show,  on: :collection
    post 'index',     on: :collection
    post 'show',      on: :collection
  end
  resources :sessions, only:[ :create]
  resources :items, except: [ :new, :edit]
  resources :orders, except: [ :new, :edit, :show ] do
    get :deleteAll, on: :collection
    post :pay, on: :collection
  end
  resources :processings, except: [ :new, :edit, :index, :update]
  resources :shoppings, except: [ :new, :edit, :index, :show ] do
    post 'index',    on: :collection
  end
  resources :shopping_phone, only:[:create]
  post '/sales', to: 'sales#index'
  root 'application#hello_world'
end
