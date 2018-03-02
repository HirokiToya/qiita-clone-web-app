Rails.application.routes.draw do

  get 'users/index'
  get "/"=>"home#top"
  get "/signup"=>"users#new"
  get "/login"=>"users#login"
  post "users/:id/update" => "users#update"
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
