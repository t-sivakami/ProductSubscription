Rails.application.routes.draw do
 
  resources :depository
  resources :products do 
    member do 
      put "add", to: "products#depository"
      put "remove", to: "products#depository"
    end
    
  end
  devise_for :users, controllers: { registrations: "registrations"}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :costing, only:[:index]
  # Defines the root path route ("/")
  root "products#index"
  resources :subscriptions

  post '/subscriptions/create' => 'subscriptions#create'
  get '/subscriptions/landing' => 'subscriptions#show'

  #map.login '/users/sign_out', :controller => 'registrations', :action => 'new'
end
