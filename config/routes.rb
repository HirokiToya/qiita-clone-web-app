Rails.application.routes.draw do

  root "home#top"
  get "/"=>"home#top"
  get 'users/index'
  get "/signup"=>"users#new"
  get "/login"=>"sessions#new"
  post "/login"=>"sessions#create"
  delete "/logout"=>"sessions#destroy"
  post "users/:id/update" => "users#update"
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
