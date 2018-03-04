Rails.application.routes.draw do

  root "home#top"
  get "/"=>"home#top"

  get "/signup"=>"users#new"
  get "/login"=>"sessions#new"
  post "/login"=>"sessions#create"
  post "users/:id/update" => "users#update"
  delete "/logout"=>"sessions#destroy"

  get "articles/index"=>"articles#index"
  get "articles/new"=>"articles#new"
  get "articles/:id"=>"articles#show"
  post "articles/create"=>"articles#create"
  get "articles/:id/edit"=>"articles#edit"
  post "articles/:id/update" => "articles#update"
  post "articles/:id/destroy" => "articles#destroy"

  
  
  
  resources :users
  resources :articles,only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
