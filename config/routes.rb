Rails.application.routes.draw do
  resources :users, expect:[ :new, :edit ]
  root 'application#hello_world'
end
