Rails.application.routes.draw do
  
  get 'history/show/:user_id', to: 'history#show'
  resources :users, except: [ :new, :edit ]
  resources :sessions, only:[ :create]
  resources :items, except: [ :new, :edit]
  resources :orders, except: [ :new, :edit, :show ] do
    get :deleteAll, on: :collection
  end
  resources :processings, except: [ :new, :edit, :index, :update]
  resources :shoppings, except: [ :new, :edit ]
  root 'application#hello_world'
end
