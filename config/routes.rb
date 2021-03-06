Rails.application.routes.draw do

    root :to => "tweets#index"
    
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    get 'logout' => "sessions#destroy"
    delete 'logout' => 'sessions#destroy'

    get 'tweets' => 'tweets#index'
    #get 'tweets/new'
    #get 'tweets/show'
    get 'tweets/main'
    post 'tweets' => "tweets#create"
    
    get "users" => "users#index"
    get 'users/show/:uid' => "users#show"
    
    post "users" => "follows#create"
    post "users/show/*" => "tweets#create"
    #get 'follows/index'
    #get 'follows/create'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
