Rails.application.routes.draw do
  resources :users, except: [ :new, :edit ]
  root 'application#hello_world'
end
